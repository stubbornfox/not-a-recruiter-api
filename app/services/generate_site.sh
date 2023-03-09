#!/bin/bash

sudo cp "nginx-config" "/etc/nginx/sites-enabled/$1"
sudo sed -i "s/custom_domain/$1/g" "/etc/nginx/sites-enabled/$1"
