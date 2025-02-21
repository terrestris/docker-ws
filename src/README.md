![](./assets/docker-logo.png)

# Orchestrierung einer GDI über Docker

Herzlich Willkommen beim **Orchestrierung einer GDI über Docker** Workshop.

Dieser Workshop wurde für die Verwendung auf der [OSGeo-Live {{ book.osGeoLiveVersion }} DVD](https://live.osgeo.org) entwickelt und soll Ihnen einen ersten Einblick in docker als Orchestrierungstool einer Geodateninfrastruktur (GDI) geben.

> ℹ️ **Information**
>
> Der Workshop kann [hier als PDF-Version](../{{ book.workshopPdfName }}) heruntergeladen werden.

Bitte stellen Sie sicher, dass Sie die Schritte der
[Vorarbeiten und generelle Informationen](environment/README.md)-Seite ausgeführt
haben, um einen reibungslosen Ablauf zu gewährleisten.

Der Workshop ist aus einer Reihe von Modulen zusammengestellt. In jedem Modul werden Sie eine Reihe von Aufgaben lösen, um ein bestimmtes Ziel zu erreichen. Jedes Modul baut Ihre Wissensbasis iterativ auf.

Die folgenden Module werden in diesem Workshop behandelt:

* [Vorarbeiten und generelle Informationen](environment/README.md)
Grundlegende Informationen zur Workshop-Umgebung (OSGeoLive, Pfade, URLs, Credentials).

* [Grundlagen Docker](basics/docker/README.md)
Grundlagenwissen zu Docker.

* [Grundlagen Docker Compose](basics/docker-compose/README.md)
Grundlagenwissen zu Docker Compose.

* [Aufbau einer Geodateninfrastruktur](gdi/README.md)
Praktischer Aufbau einer exemplarischen GDI mit Docker und Docker Compose.

# Autoren

{% for author in book.authors %}
  - {{ author.name }} ([{{ author.mail }}](mailto:{{ author.mail }}))
{% endfor %}
