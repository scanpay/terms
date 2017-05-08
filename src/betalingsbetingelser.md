{% extends "template.tpl" %}
{% set title = "Betalingsbetingelser" %}

{% block terms %}
<header>
  <h1 class="terms--h1">{{ title }}</h1>
</header>
<article data-date="{{ date }}" data-hash="{{ hash }}">
  <p>
    Disse betingelser vedrører indbetalinger med kredit- og debetkort, herunder Dankort, Visa og MasterCard. Kundens inbetaling konverteres til elektroniske penge ("e-penge"), som er underlagt lov om betalingstjenester og elektroniske penge.
  </p>

  <h3 class="terms--h3">E-penge</h3>
  <p>
    E-penge kan udelukkende bruges til at betale for ydelser og services hos Scanpay. Kunden kan udbetale sine e-penge til et betalingskort som tilhører kunden. Ved udbetaling betaler kunden alle transaktionsomkostninger.
  </p>

  <h3 class="terms--h3">Automatisk optankning</h3>
  <p>
    Du har mulighed for at aktivere automatisk optankning, hvorved Scanpay automatisk hæver et fast aftalt beløb, hvis din saldo bliver negativ. Automatisk optakning kan opsiges i vores dashboard.
  </p>

  <h3 class="terms--h3">Kvittering</h3>
  <p>
    Kunden modtager en kvittering som fremsendes pr. email.
  </p>
</article>
{% endblock %}
