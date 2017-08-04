<!DOCTYPE HTML>
<link href="style.css" rel="stylesheet">
<title>{{ title }} - Scanpay</title>

<div class="c">
  {% block terms %}{% endblock %}
</div>

{% set months = ['jan', 'feb', 'mar', 'apr', 'maj', 'juni',
                'juli', 'aug', 'sept', 'okt', 'nov', 'dec'] %}
<footer>
  Sidst ændret den {{ day }}. {{ months[month] }}, {{ year }}
  <br>
  <a class="commit" rel="nofollow" target="_blank" href="https://github.com/scanpaydk/terms/commit/{{ hash }}">{{ hash }}</a>
</footer>
