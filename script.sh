#!/bin/bash

# Constantes
CONF_SQUIDGUARD="https://raw.githubusercontent.com/ThomasTartrau/sn2-proxy_squid-Tartrau-Thomas/refs/heads/main/squidGuard.conf"
BLOCK_DOMAINS="https://raw.githubusercontent.com/ThomasTartrau/sn2-proxy_squid-Tartrau-Thomas/refs/heads/main/domains"
BLOCK_URLS="https://raw.githubusercontent.com/ThomasTartrau/sn2-proxy_squid-Tartrau-Thomas/refs/heads/main/urls"
ALLOWED_NETWORK="192.168.121.0/24"

# Installation de apache2 pour le serveur web
sudo apt install apache2 -y > /dev/null

# Mise à jour de la page de réponse d'apache2 lors de l'erreur 
echo "STOOOOOOOOOOOOOOP" | sudo tee /var/www/html/index.html > /dev/null

# Indique à Squid quel programme exécuter pour réécrire ou filtrer les URL qui est la conf de squidGuard actuellement (Merci ChatGPT pour la 1ère phrase, je n'arrivais pas à expliquer ça)
echo "url_rewrite_program /usr/bin/squidGuard" | sudo tee -a /etc/squid/squid.conf > /dev/null

# Ajoute devant "http_access" dans le fichier "/etc/squid/squid.conf" les paramètres nécessaires pour autoriser tout dans le réseau 192.168.121.0/24
sudo sed -i '/http_access deny all/i \acl allowed_network src '$ALLOWED_NETWORK'\nhttp_access allow allowed_network' /etc/squid/squid.conf

# Sauvegarder l'ancien fichier de configuration
sudo mv /etc/squidguard/squidGuard.conf /etc/squidguard/squidGuard.conf.backup

# Récupère le fichier de configuration de squidGuard et le place dans le répertoire /etc/squidguard/
sudo wget -O /etc/squidguard/squidGuard.conf $CONF_SQUIDGUARD > /dev/null

# Création du répertoire /etc/squidguard/block
sudo mkdir /etc/squidguard/block

# Récupère les fichiers qui contiennent les domaines et les urls à bloquer et les place dans le répertoire /etc/squidguard/block
sudo wget -O /etc/squidguard/block/domains $BLOCK_DOMAINS > /dev/null
sudo wget -O /etc/squidguard/block/urls $BLOCK_URLS > /dev/null

# Redémarre le service squid
sudo systemctl restart squid

# Echo installed
echo "Installed"