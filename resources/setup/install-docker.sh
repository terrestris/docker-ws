#!/bin/bash

apt update
apt install docker docker-compose-v2
usermod -aG docker $USER
newgrp docker
