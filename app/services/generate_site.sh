#!/bin/bash

sudo cp "/home/rails/apps/not_a_recruiter_api/current/app/services/nginx-config" "/etc/nginx/sites-enabled/$1"
sudo sed -i "s/custom_domain/$1/g" "/etc/nginx/sites-enabled/$1"
sudo systemctl reload nginx
