# TODOS

* Architekturskizze der Beispiel-App
* Aufgaben:
  * PostGIS:
    * docker-compose für Datenbank auf Basis des `mdillon/postgis` [Images](https://hub.docker.com/r/mdillon/postgis/) in Version `11-alpine` erstellen
      * Achten Sie beim Anlegen des Services auf das Weiterleiten des Ports (5432) auf den Host und legen Sie einen User mit den folgenden Zugangsdaten an: `fossgis:fossgis`
      * Mounten Sie das Datenverzeichnis der Datenbank (`/var/lib/postgresql/data`) auf das Hostsystem.
    * Starten Sie den Service (über docker-compose) und verbinden Sie sich z.B. über pgAdmin mit der Datenbank.
    * Importieren Sie die Stadtgebiete Freiburgs (siehe [hier](/materials/data/stadtteile.sql)) in die Datenbank.
  * GeoServer
    * docker-compose erweitern durch GeoServer Image `terrestris/geoserver:2.15.2` [Image](https://hub.docker.com/r/terrestris/geoserver)
    * Auf Ports (8080), Volume (`/opt/geoserver_data`) achten und `depends_on`

    * OL Client

  * Dockerfile auf Basis von nginx erstellen, einfache HTML Seite veröffentlichen
  * Dockerfile für Frontend-App erstellen

  * Daten importieren (z.B. über pgadmin oder qgis)
  * Layer erstellen
    * Arbeitsbereich FOSSGIS erstellen
    * Datenspeicher POSTGIS erstellen
    * Layer STADTTEILE anlegen


* In nginx Container mit docker exec und `<title>` der `index.html` anpassen, anschließend Container recreate