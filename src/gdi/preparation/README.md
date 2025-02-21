# Vorarbeiten

Bevor wir mit der Einrichtung der Geodateninfrastruktur beginnen, müssen wir einige Vorbereitungen treffen.

1. **Neues Verzeichnis anlegen**

   Erstellen Sie ein neues Verzeichnis namens `docker-gdi`, in dem alle notwendigen Dateien gespeichert werden:

   ```bash
   mkdir -p ~/docker-gdi
   cd ~/docker-gdi
   ```

2. **Materialien herunterladen und entpacken**

   Laden Sie das Archiv [materials.zip](https://github.com/terrestris/docker-ws/raw/refs/heads/main/materials/materials.zip) in das `docker-gdi`-Verzeichnis herunter und entpacken Sie es:

   ```bash
   wget https://github.com/terrestris/docker-ws/raw/refs/heads/main/materials/materials.zip
   unzip materials.zip
   ```
   Das Archiv enthält einige wichtige Dateien, die wir später benötigen.

3. **Neue Datei anlegen**

    Legen Sie eine Datei namens **`docker-compose.yml`** an.

📌 Hinweis: Die `docker-compose.yml` werden wir in den folgenden Abschnitten um unsere Dienste erweitern. Wir beginnen mit der Bereitstellung einer [PostGIS Datenbank](../postgis/README.md).
