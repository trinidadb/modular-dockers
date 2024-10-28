#!/bin/bash
# https://docs.docker.com/engine/install/ubuntu/

sudo apt-get update
sudo apt-get install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Check if VERSION_CODENAME has a value, if not, assign it
[ -z "$VERSION_CODENAME" ] && VERSION_CODENAME=$(grep VERSION_CODENAME /etc/os-release | cut -d'=' -f2) && echo "VERSION_CODENAME is set to: $VERSION_CODENAME"

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $VERSION_CODENAME stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

if sudo apt-get update; then
    echo "Repository updated successfully."
else
    echo "Repository update failed. Switching GPG key method."
    # Alternate GPG key method if initial method fails
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      $VERSION_CODENAME stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
fi

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo docker run hello-world

sudo apt-get update

sudo apt-get install docker-compose-plugin
