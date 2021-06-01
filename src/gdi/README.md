# Beispiel-GDI

In diesem Kapitel werden wir eine exemplarische GDI bestehend aus den
folgenden Komponenten aufbauen:
  * PostGIS Datenbank zur Persistierung der Geodaten.
  * GeoServer zur Veröffentlichung der Geodaten über OGC-Dienste.
  * OpenLayers Applikation zur Anzeige der Geodaten über den Browser.

![Zielarchitektur der GDI](../assets/architecture.png)

## Aufgaben

### PostGIS-Service

* Legen Sie eine neue Datei namens `docker-compose.yml` in einem beliebigen Verzeichnis an.
* Fügen Sie dieser Datei einen neuen Service `fossgis-postgis` basierend auf dem `mdillon/postgis` [Image](https://hub.docker.com/r/mdillon/postgis/) in Version `11-alpine` hinzu.
  * Achten Sie beim Anlegen des Services auf das korrekte Weiterleiten des internen Ports (5432) auf den Host (5433) und legen Sie einen User mit den Zugangsdaten `fossgis:fossgis` an.
  * Mounten Sie das Datenverzeichnis der Datenbank (`/var/lib/postgresql/data`) auf das Hostsystem.
* Starten Sie den Service (über `docker-compose`) und verbinden Sie sich z.B. über `pgAdmin` mit dem Datenbank-Server und der Datenbank `fossgis`.
* Importieren Sie die Stadtgebiete Freiburgs (siehe `stadtteile.sql` aus [Materialien]({{ book.workshopMaterialsDownloadUrl }})) in die Datenbank.

![pgAdmin nach Import der Geodaten](../assets/pgadmin.png)

### GeoServer-Service

* Erweitern Sie die `docker-compose.yml` durch den Service `fossgis-geoserver` und nutzen Sie dabei das `terrestris/geoserver:2.15.2` [Image](https://hub.docker.com/r/terrestris/geoserver).
  * Achten Sie auch hier auf das korrekte Mappen des internen Ports (8080) auf den Host (8080).
  * Mounten Sie das Datenverzeichnis des GeoServers (`/opt/geoserver_data`) auf das Hostsystem.
  * Bestimmen Sie zusätzlich die Startreihenfolge der Services mittels `depends_on`:
    1. `fossgis-postgis`
    2. `fossgis-geoserver`
* Stoppen Sie, falls noch nicht geschehen den bisherigen Service und starten Sie das compose Netzwerk neu.
* Öffnen Sie den GeoServer über die Adresse [http://localhost:8080/geoserver](http://localhost:8080/geoserver) im Browser. Nutzen Sie als Anmeldedaten `admin:geoserver`.
* Legen Sie einen neuen Arbeitsbereich `FOSSGIS` an.
* Legen Sie einen neuen Datenspeicher `POSTGIS` an. Wählen Sie dabei die Verbindungsparameter des `fossgis-postgis` Services an.
* Legen Sie anschließend einen neuen Layer `STADTTEILE` auf Basis des Datenspeichers `POSTGIS` und der Tabelle `stadtteile` an.
* Optional: Nutzen Sie den Stil `stadtteile.sld` der [Materialien]({{ book.workshopMaterialsDownloadUrl }}) und weisen Sie diesen dem Layer zu.

![Startansicht des GeoServers nach Login](../assets/geoserver-start-screen.png)

### nginx-Service (OpenLayers Anwendung)

* Erstellen Sie auf Ebene der `docker-compose.yml` ein neues Verzeichnis `fossgis-nginx` und dort eine neue Datei `Dockerfile`.
* Legen Sie das `client`-Verzeichnis sowie die `default.conf` der [Materialien]({{ book.workshopMaterialsDownloadUrl }}) neben der `Dockerfile` ab.
* Öffnen Sie die `Dockerfile` und:
  * Wählen Sie als Basisimage die aktuelle Version des offiziellen nginx [Images](https://hub.docker.com/_/nginx) aus.
  * Kopieren Sie die Konfigurationsdatei `default.conf` in das Image und wählen Sie als Zielpfad `/etc/nginx/conf.d/default.conf`.
  * Kopieren Sie den Inhalt des entpackten Client-Archivs `client` in das Image und wählen Sie als Zielpfad `/etc/nginx/html`.
  * Geben Sie den Port (80) des nginx-Prozesses in der `Dockerfile` an.
* Fügen Sie der `docker-compose.yml` einen neuen Service `fossgis-nginx` hinzu.
  * Veröffentlichen Sie den Service-Port 80 auf dem 8000er Port des Hosts und wählen Sie als Build-Context die zuvor erstellte `Dockerfile`.
  * Achten Sie bei der Startreihenfolge darauf, dass der `nginx` Service zuletzt gestartet wird.
* Starten Sie anschließend alle Services neu und öffnen Sie [http://localhost:8000](http://localhost:8000) im Browser.

![Startansicht des Kartenclients](../assets/ol-client.png)

### Bonus

* Verbinden Sie sich über das Terminal mit dem laufenden nginx-Container und ändern Sie den Wert des `<title>` Elements der `index.html` auf einen Wert Ihrer Wahl. Laden Sie anschließend die Applikation im Browser neu.
* Was passiert, wenn der Service neu gestartet wird? Was passiert, wenn der Container neu gebaut wird?
