#!/bin/bash
read -p "Enter the remote host (default: staging-area.der.usal.es): " remote_host
remote_host=${remote_host:-staging-area.der.usal.es}
read -p "Enter the admin password: " admin_password
read -p "Enter the topic to subscribe to: " topic

sudo apt install -y mosquitto-clients
mosquitto_sub -h "$remote_host" -v -t "$admin_password" -u admin -P "$topic"