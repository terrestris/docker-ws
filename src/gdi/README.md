# Aufbau einer Geodateninfrastruktur

In diesem Kapitel werden wir Schritt für Schritt eine Geodateninfrastruktur (GDI) aufbauen. Ziel ist es, eine vollständige Umgebung zur Speicherung, Bereitstellung und Visualisierung von Geodaten zu erstellen. Dabei setzen wir auf bewährte Open-Source-Technologien, die in vielen professionellen GIS-Projekten weltweit zum Einsatz kommen.

Unsere GDI wird aus den folgenden Kernkomponenten bestehen:

- **OpenLayers** – Eine moderne, JavaScript-basierte Open-Source-Bibliothek, mit der wir interaktive Karten direkt im Browser anzeigen und mit ihnen interagieren können.
- **GeoServer** – Ein flexibler und weit verbreiteter Kartenserver, mit dem wir unsere Geodaten über standardisierte OGC-Dienste (z. B. WMS, WFS, WCS) bereitstellen können.
- **PostGIS** – Eine leistungsstarke Erweiterung für die PostgreSQL-Datenbank, die es uns ermöglicht, Geodaten effizient zu speichern, zu verwalten und abzufragen.

Während des Workshops werden wir die einzelnen Komponenten installieren, konfigurieren und in ein funktionierendes System integrieren. Am Ende hast du eine lauffähige GDI, mit der du eigene Geodaten verwalten und visualisieren kannst.

## Zielarchitektur

![Zielarchitektur der GDI](../assets/architecture.png)

## Nächste Schritte

Im Folgenden werden wir die einzelnen Komponenten der Geodateninfrastruktur (GDI) Schritt für Schritt einrichten. Wir beginnen mit den Geodaten in der Datenbank, setzen mit dem GeoServer anschließend Geodienste darauf auf, um diese schließlich mit einer kleinen OpenLayers-Webanwendung zu visualisieren.

- [Vorarbeiten](preparation/README.md)
- [PostGIS](postgis/README.md)
- [GeoServer](geoserver/README.md)
- [OpenLayers über nginx](nginx/README.md)

Folgen Sie den jeweiligen Links, um zur detaillierten Anleitung für die einzelnen Komponenten zu gelangen. 🚀
