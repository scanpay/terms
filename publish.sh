#!/bin/bash
set -e
rm -rf www

IP=139.162.189.178
FOLDER=/srv/terms1/

# Timestamp of the last modified file in a folder.
gitstamp() {
    git log --pretty=format:%cd -n 1 --date=format:%s "$1"
}

compress() {
    echo -n "compressing $1..."
    zopfli --i100 "$1"
    bro --quality 11 --input "$1" --output "$1.br"
    touch -r "$1" -c "$1".{br,gz}
    printf " \033[0;32mOK\033[0m\n"
}

if [[ -n "$(git status --porcelain 2>&1)" ]]; then
    printf "\033[0;31mWARNING: Uncommitted changes\033[0m\n" >&2
    read -p "Do you want to continue? [y/N]: " res
    [[ "$res" == y ]] || exit 0
fi

git fetch
if [[ "$(git rev-parse master)" != "$(git rev-parse origin/master)" ]]; then
    printf "\033[0;31mWARNING: Not synced to upstream\033[0m\n" >&2
    read -p "Do you want to continue? [y/N]: " res
    [[ "$res" == y ]] || exit 0
fi

# Steal modification time from git
find src/ -type f | while read f; do
    t=$(git log --pretty=format:%cd -n 1 --date=format:%Y%m%d%H%M.%S "$f")
    [[ -n "$t" ]] && touch -t "$t" "$f"
done

# build CSS
gulp css

# Minify CSS
for f in www/*.css; do
    csso "$f" -o "$f.tmp" --restructure-off
    touch -r "$f" "$f.tmp"
    mv "$f.tmp" "$f"
    compress "$f"
done

# Build HTML from *.md
for f in */*.md; do
    HASH=$(git log -n 1 --pretty=format:%H -- "$f")
    gulp file --src "$f" --hash "$HASH" --date "$(gitstamp "$f")"
done

# Minify HTML
find www -iname '*.html' | while read f; do
    html-minifier -c htmlmin.conf -o "$f.tmp" "$f" || exit 1
    touch -r "$f" "$f.tmp"
    sed 's! xmlns="http://www\.w3\.org/2000/svg"!!g' "$f.tmp" > "$f" || exit 1
    touch -r "$f.tmp" "$f"
    rm -f "$f.tmp"
    compress "$f"
done

printf "\033[0;31mWARNING: Production environment\033[0m\n" >&2
read -p "Type 'publish' to publish to $FOLDER: " res
[[ "$res" == publish ]] || exit 0

rsync -rtOvp --chmod=ug=rw,o=r,Dugo+x,Dg+s --delete-after --progress -e ssh www/ "$IP:$FOLDER"
