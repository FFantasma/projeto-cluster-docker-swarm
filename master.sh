#!/bin/bash

echo "Inicializando docker swarm no Master"


sudo docker swarm init --advertise-addr=192.168.0.50
sudo docker swarm join-token worker | grep docker > /vagrant/worker.sh