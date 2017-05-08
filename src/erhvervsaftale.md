{% extends "template.tpl" %}
{% set title = "Erhvervsaftale" %}

{% block terms %}
<header>
  <h1 class="terms--h1">{{ title }}</h1>
</header>
<article data-date="{{ date }}" data-hash="{{ hash }}">
  <p>
    Denne erhvervsaftale indgås mellem Scanpay ApS (CVR. <a target="_blank" href="https://datacvr.virk.dk/data/visenhed?enhedstype=virksomhed&id=35413308&soeg=35413308">DK35413308</a>) og den juridiske person ("kunden"), der accepterer aftalen. Begge parter kan opsige aftalen uden varsel.
  </p>

  <h3 class="terms--h3">Ydelse</h3>
  <p>
    Aftalen giver adgang til en erhvervskonto, som kunden kan bruge til at tage imod betaling online. Scanpay er en betalingsgateway og kunden skal derfor selv indgå en indløsningsaftale med en af Scanpays partnere.
  </p>

  <h3 class="terms--h3">Gebyrer</h3>
  <p>
    Kunden skal betale 0,25 DKK pr. transaktion, som kunden vælger at indløse. Kunden faktureres månedligt bagud. Alle priser er ekskl. moms og kunden har ikke fortrydelsesret.
  </p>

  <h3 class="terms--h3">Datapolitik</h3>
  <p>
    Kunden er dataansvarlig og Scanpay er databehandler. Alle data, som Scanpay modtager fra kunden, tilhører kunden. Aftalen giver Scanpay samtykke til at behandle og opbevare kundens data. Kundens data behandles fortroligt og videregives ikke til tredjemand. Kunden har ret til at eksportere sine data til løsninger og systemer, der er PCI certificeret.
  </p>

  <h3 class="terms--h3">Sikkerhed</h3>
  <p>
    Scanpay er PCI DSS level 1 certificeret. Kundens data opbevares inden for EU og er krypteret med 256-bit AES-GCM. Ved brud på datasikkerheden vil Scanpay informere kunden herom senest 24 timer efter, at at bruddet er opdaget. Scanpay har tavshedspligt ift. kundens data,  forretningshemmeligheder og information, som rimeligvis må betragtes som fortrolige.
  </p>

  <h3 class="terms--h3">Ansvar</h3>
  <p>
    Scanpay hæfter ikke for driftstab, avancetab eller andet indirekte tab, der opstår som følge af driftsforstyrrelser eller fejl. Ved tvister mellem kunden og Scanpay gælder dansk ret og værneting er Sø- og Handelsretten i København.
  </p>
</article>
{% endblock %}
