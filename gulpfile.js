/**
*   @author ScanPay ApS
**/
'use strict';

const gulp = require('gulp');
const nunjucks = require('nunjucks');
const less = require('gulp-less');
const through = require('through2');
const rename = require("gulp-rename");
const env = require('minimist')(process.argv.slice(2));
const connect = require('gulp-connect');

// File timestamp (footer)
const date = new Date((env.date || 1) * 1000);
env.month = date.getMonth();
env.day = date.getDate();
env.year = date.getFullYear();

function proxy(req, res, next) {
    const https = require('https');
    const options = {
        hostname: 'scanpay.dk',
        port: 443,
        path: req.url,
        method: 'GET',
        headers: req.headers,
        agent: new https.Agent()
    };
    options.headers.host = 'scanpay.dk';
    options.headers.origin = 'https://scanpay.dk';

    const proxyreq = https.request(options, (srvRes) => {
        res.writeHead(srvRes.statusCode, srvRes.headers);
        srvRes.pipe(res);
    }).on('error', () => {
        next();
    }).on('socket', (socket) => {
        socket.setTimeout(10 * 1000);
        socket.on('timeout', () => { proxyreq.abort(); });
    });
    req.pipe(proxyreq);
}

function webserver() {
    connect.server({
        root: 'www',
        livereload: true,
        port: 8080,
        middleware: () => ([(req, res, next) => {
            // Add .html extension
            if (req.url.substring(0, 3) === '/a/') {
                return proxy(req, res, next);
            }
            next();
        }])
    });
}

let includes;
function loadIncludes(done) {
    includes = new nunjucks.FileSystemLoader('src/includes');
    done();
}

function nunj(o={}) {
    return through.obj(function (file, enc, cb) {
        if (!o.hasOwnProperty('autoescape')) { o.autoescape = false; }
        const nenv = new nunjucks.Environment(includes, o);
        nenv.renderString(file.contents.toString('utf8'), o.locals, (err, res) => {
            if (err) { throw err; }
            file.contents = new Buffer(res);
            cb(null, file);
        });
    });
}

function html() {
    return gulp.src(env.src ? env.src : 'src/*.md')
    .pipe(nunj({ locals: env }))
    .pipe(rename(path => { path.extname = ".html"; }))
    .pipe(gulp.dest('www/static/'));
}

function withCSS() {
    return gulp.src(env.src ? env.src : 'src/*.md')
    .pipe(nunj({ locals: Object.assign(env, { withCSS: true }) }))
    .pipe(rename(path => { path.extname = ".html"; }))
    .pipe(gulp.dest('www'))
    .pipe(connect.reload());
}

function css() {
    return gulp.src(['src/css/*.less'])
    .pipe(less())
    .pipe(gulp.dest('www'))
    .pipe(connect.reload());
}

function stalker() {
    gulp.watch(['src/css/*.less'], css);
    gulp.watch(['src/*.md'], withCSS);
    gulp.watch(['src/includes/**'], gulp.series('build'));
}

gulp.task('css', css);
gulp.task('file', gulp.series(loadIncludes, html, withCSS));
gulp.task('build', gulp.series('file', 'css'));
gulp.task('serve', gulp.parallel(stalker, webserver));
gulp.task('default', gulp.series('build', 'serve'));
