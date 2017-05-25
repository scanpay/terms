{% extends "template.tpl" %}
{% set title = "Brugeraftale" %}

{% block terms %}
<header>
  <h1 class="terms--h1">{{ title }}</h1>
</header>
<article data-date="{{ date }}" data-hash="{{ hash }}" class="terms--">
  <p>
    Denne brugeraftale indgås mellem dig, som privatperson, og Scanpay ApS (CVR. <a target="_blank" href="https://datacvr.virk.dk/data/visenhed?enhedstype=virksomhed&id=35413308&soeg=35413308">DK35413308</a>). Begge parter kan opsige aftalen uden varsel, hvorved alle dine personlige oplysninger vil blive slettet.
  </p>

  <h3 class="terms--h3">Brugerkonto</h3>
  <p>
    Din brugerkonto er personlig og må kun benyttes af dig. Kontoen er gratis og du må kun have én konto. Du har det fulde ansvar for, hvad din konto bliver brugt til. Du har pligt til at sikre, at de oplysninger, der fremgår af din brugerkonto, er korrekte og opdaterede. Hvis du får mistanke om, at andre har adgang til din brugerkonto, skal du straks ændre din adgangskode og kontakte os.
  </p>

  <h3 class="terms--h3">Personlige oplysninger</h3>
  <p>
    Aftalen giver Scanpay lov til at behandle og opbevare dine almindelige persondata (navn, adresse m.m.). Persondata behandles fortroligt og videregives ikke til tredjemand. Du har altid ret til indsigt i hvilke oplysninger, vi har registreret om dig, og indsigt i hvordan dine oplysninger behandles og opbevares.
  </p>

  <h3 class="terms--h3">Sikkerhed</h3>
  <p>
    Persondata opbevares inden for EU og er krypteret med 256-bit AES-GCM. Din adgangskode er sikret med hashfunktionen <a target="_blank" href="https://en.wikipedia.org/wiki/Scrypt">scrypt</a>. Ved brud på persondatasikkerheden vil vi informere dig herom senest 24 timer efter, at bruddet er opdaget.
  </p>
</article>
{% endblock %}
