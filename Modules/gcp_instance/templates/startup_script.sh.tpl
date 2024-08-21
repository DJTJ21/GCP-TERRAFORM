#!/bin/bash
# Script de démarrage pour l'instance {{ instance_name }}

# Mettre à jour et installer les dépendances
apt-get update -y
apt-get upgrade -y
apt-get install -y nginx

# Démarrer Nginx
systemctl start nginx
systemctl enable nginx

# Afficher un message de confirmation
echo "Instance {{ instance_name }} dans le projet {{ project_id }} est prête!"
