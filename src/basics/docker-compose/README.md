# Docker Compose

`Docker Compose` bietet die Möglichkeit, verschiedene Dienste (Container) in einer YAML-Datei zu definieren (docker-compose.yml).
Dies bietet den Vorteil, mehrere Container auf eine übersichtliche Art und Weise konfigurieren und orchestrieren zu können.

> ℹ️ **Information**
>
> Die Dokumentation zu `Docker Compose` findet sich auf [https://docs.docker.com/compose/](https://docs.docker.com/compose/).

`Docker Compose` wird überlicherweise genutzt um Entwicklungsumgebungen aufzusetzen, automatisiertes Testen zu ermöglichen
oder eben auch um GDIs mit geringem Aufwand zusammenzustellen. Ein großer Vorteil von `Docker Compose` ist das gleichzeitige
starten mehrerer Container mit nur einem Befehl. Zusätzlich können wir auch Abhängigkeiten zwischen den verschiedenen Containern
definieren. Dazu später mehr.

In einer `docker-compose.yml` können sowohl lokale Dockerfiles, als auch veröffentlichte Images direkt eingebunden werden.

Dies sieht beispielsweise folgendermaßen aus:

```yaml
version: '3',
services:
  my-local-dockerfile:
    build:
      context: relative-directory-containing-the-dockerfile/
  local-or-remote-image:
    image: image-name:version
```

## Wichtige Konfigurations-Parameter

* **image**
  * Image, auf Basis dessen der Container gestartet werden soll
* **ports**
  * Ports, die von außerhalb der Container zugreifbar sein sollen. Syntax: `hostMachinePort:containerPort`
(z.B. `8080:80` stellt Port 80 des Containers auf Port 8080 der Host Maschine frei)
* **environment**
  * Umgebungsvariablen die dem Container mitgegeben werden sollen (bspw. Nutzername und Passwort)
* **volumes**
  * Pfade, die von der Host Maschine in den Container eingehangen werden sollen
* **context**
  * Pfad zu einer Dockerfile, welche zum Erstellen des Images genutzt werden soll

## Aufgaben

Erstellen Sie eine Datei `docker-compose.yml` in einem beliebiegen Verzeichnis (z.B. `/home/user/docker-ws`) und fügen Sie folgenden Inhalt ein:

```yaml
version: '3.8'
services:
  fossgis-geoserver:
    image: docker.osgeo.org/geoserver:2.26.2
    ports:
      - "8080:8080"
  fossgis-postgis:
    image: postgis/postgis:16-3.5-alpine
    ports:
      - "5433:5432"
    environment:
      POSTGRES_USER: fossgis
      POSTGRES_PASSWORD: fossgis
```

Speichern Sie das Dokument und wechseln Sie in das Terminal. Führen Sie dort den folgenden Befehl im Verzeichnis der `docker-compose.yml` aus:

```bash
docker compose up
```

Beobachten Sie den Terminal-Output, was fällt Ihnen aus? Öffnen Sie anschließend im Browser die Adresse [http://localhost:8080/geoserver](http://localhost:8080/geoserver) (Anmeldedaten `admin:geoserver`).


## Wichtige Befehle

* **`docker compose help`**
  * **`docker compose help [command]`**, z.B. **`docker compose help build`**
* **`docker compose build`**
  * zur Erzeugung der Services, die in der Datei `docker-compose.yml` definitiert sind
* **`docker compose up`**
  * zum Starten der Services/Container
  * Mit dem Parameter **`-f`** lassen sich auch Dateien angeben, die nicht `docker-compose.yml` heißen (z.B. unterschiedliche Konfiguration    für verschiedene Umgebungen)
* **`docker compose down`**
  * zum Stoppen der Services/Container
* **`docker compose logs [service…]`**
  * zum Einsehen der Logs eines (oder mehrerer) Services/Container
* **`docker compose restart [service…]`**
  * zum Neustarten eines (oder mehrerer) Services/Container
