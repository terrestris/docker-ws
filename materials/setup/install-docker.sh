#!/bin/bash

apt update
apt install docker.io docker-compose
usermod -aG docker $USER
newgrp docker
