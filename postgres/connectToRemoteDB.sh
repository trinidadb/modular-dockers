#!/bin/bash
read -p "Enter the remote host (default: staging-area.der.usal.es): " remote_host
remote_host=${remote_host:-staging-area.der.usal.es}

sudo apt install -y postgresql-client
psql -h "$remote_host" -p 5432 -U admin "my-db"