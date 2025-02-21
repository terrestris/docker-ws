# Einrichten des nginx-Services

Im letzten Schritt unseres Workshops richten wir einen **nginx-Service** ein, der als HTTP-Server eine **OpenLayers-Anwendung** bereitstellt.
Dieser Service wird als dritter und letzter Bestandteil unserer Geodateninfrastruktur in die `docker-compose.yml` integriert.


## Verzeichnisstruktur & Dateien vorbereiten

📂 Neues Verzeichnis für den nginx-Service anlegen:

```bash
mkdir fossgis-nginx
```

📄 Erstellen Sie in diesem Verzeichnis eine neue Datei namens `Dockerfile`

📥 Dateien aus der `materials.zip` einbinden:

- Kopieren Sie das `client`-Verzeichnis nach `fossgis-nginx`.
- Kopieren Sie die `default.conf` nach `fossgis-nginx`.


## `Dockerfile` erstellen

Öffnen Sie das `Dockerfile` in einem Editor und definieren Sie ein aktuelles nginx Docker-Image als Basis.
Nutzen Sie die aktuelle Version des offiziellen [nginx-Images](https://hub.docker.com/_/nginx).

Erweitern Sie das Dockerfile um folgende Schritte:

- Kopieren Sie die nginx-Konfiguration `default.conf` in das Image:
   - Zielpfad: `/etc/nginx/conf.d/default.conf`
- Kopieren Sie den Inhalt des `client`-Verzeichnisses in das Image:
   - Zielpfad: `/etc/nginx/html`
- Geben Sie den Port **80** für den nginx-Prozess an.


## nginx-Service hinzufügen

Erweitern Sie die bestehende **`docker-compose.yml`** um einen weiteren Service.

* Name: `fossgis-geoserver`

Folgende Punkte sollten berücksichtigt werden:

- Statt eines Image einen Build-Context nutzen, also das Dockerfile im `fossgis-nginx`-Unterverzeichnis.
- Port-Mapping:
   - Container-Port: `80`
   - Host-Port: `8000`
- Startreihenfolge (`depends_on`) beachten:
   - `fossgis-geoserver`

✏️ **Hinweis:** nginx wird als **letzter Dienst** gestartet, damit die Geodaten bereits verfügbar sind.


## Alle Services neu starten

Falls nötig, stoppen Sie alle Services:

```bash
docker compose down
```

Starten Sie anschließend das gesamte Compose-Netzwerk neu:

```bash
docker compose up --build
```


## OpenLayers-Anwendung aufrufen

Nach dem erfolgreichen Start können Sie die **OpenLayers-Anwendung** im Browser öffnen:

🔗 [http://localhost:8000](http://localhost:8000)


## 🎯 Geschafft!

Ihre komplette Geodateninfrastruktur läuft nun mit Docker.

✅ **PostGIS-Datenbank** speichert die Geodaten

✅ **GeoServer** stellt OGC-Dienste bereit

✅ **nginx** hostet die OpenLayers-Anwendung

➡️ Weiter zur [Musterlösung](../solution//README.md) 🚀
