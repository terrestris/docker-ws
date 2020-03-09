# Installation/Vorbereitung

* user:user

* sudo apt install docker.io
* sudo usermod -aG docker $USER
* newgrp docker
* docker run hello-world

* sudo apt install docker-compose

# Aufgaben:



# Links:

* http://localhost/geoserver (admin:geoserver)

# Daten

* https://fritz.freiburg.de/Informationsportal/configurator?scenario=OpenData
* https://hub.docker.com/r/terrestris/geoserver

# Vorbereitungsschritte

* shp2pgsql -s 31467:3857 -c -g geom -I stadtteile.shp public.stadtteile > stadtteile.sql
