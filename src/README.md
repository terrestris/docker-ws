![](./assets/docker-logo.png)

# Orchestrierung einer GDI über Docker

Herzlich Willkommen beim **Orchestrierung einer GDI über Docker** Workshop auf der FOSSGIS 2020
in Freiburg.

Dieser Workshop wurde für die Verwendung auf der [OSGeo-Live {{ book.osGeoLiveVersion }} DVD](https://live.osgeo.org) entwickelt und soll Ihnen einen ersten Einblick in docker als Orchestrierungstool einer Geodateninfrastruktur (GDI) geben.

> **info**
>
> Der Workshop kann [hier als PDF-Version]({{ book.workshopPdfUrl }}) heruntergeladen werden.

Bitte stellen Sie sicher, dass Sie die Schritte der
[Vorarbeiten und generelle Informationen](environment/README.md)-Seite ausgeführt
haben, um einen reibungslosen Ablauf zu gewährleisten.

Der Workshop ist aus einer Reihe von Modulen zusammengestellt. In jedem Modul werden Sie eine Reihe von Aufgaben lösen, um ein bestimmtes Ziel zu erreichen. Jedes Modul baut Ihre Wissensbasis iterativ auf.

Die folgenden Module werden in diesem Workshop behandelt:

* [Vorarbeiten und generelle Informationen](environment/README.md)
Grundlegende Informationen zur Workshop-Umgebung (OSGeoLive, Pfade, URLs, Credentials).

* [Grundlagen Docker](basics/docker/README.md)
Grundlagenwissen zu Docker.

* [Grundlagen docker-compose](basics/docker-compose/README.md)
Grundlagenwissen zu docker-compose.

* [Beispiel-GDI](gdi/README.md)
Praktischer Aufbau einer exemplarischen GDI mit Docker und docker-compose.

# Autoren

{% for author in book.authors %}
  - {{ author.name }} ([{{ author.mail }}](mailto:{{ author.mail }}))
{% endfor %}
