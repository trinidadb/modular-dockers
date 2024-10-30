#!/bin/bash
read -p "Enter the remote host (default: staging-area.der.usal.es): " remote_host
remote_host=${remote_host:-staging-area.der.usal.es}

sudo apt install mongodb-clients
mongo --host "$remote_host" --port 27017 -u root -p password1234 --authenticationDatabase admin "my-db"