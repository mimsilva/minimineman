#!/bin/bash

# Atualiza pacotes
sudo apt update && sudo apt upgrade -y

# Instala Git
sudo apt install -y git

# Instala dependências
sudo apt install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    software-properties-common

# Cria diretório para chave GPG
sudo install -m 0755 -d /etc/apt/keyrings

# Baixa e instala chave GPG do Docker
curl -fsSL https://download.docker.com/linux/debian/gpg | \
    sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Adiciona o repositório do Docker para Debian
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Atualiza de novo
sudo apt update

# Instala Docker e plugins
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo docker-compose up -d

