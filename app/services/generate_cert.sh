#!/bin/bash

sudo cp "nginx-config" "/etc/nginx/sites-enabled/$1"
sudo sed -i "s/custom_domain/$1/g" "/etc/nginx/sites-enabled/$1"
sudo certbot --nginx -d $1
sudo systemctl reload nginx

# domains=$(sudo certbot certificates --cert-name qrhire.net | grep Domains | cut -d':' -f2 | sed "s/ /,/g")
# domains_str=`echo "$1$domains"`
# echo "e" | sudo certbot certonly -d $domains_str --nginx


# certbot --authenticator standalone --installer nginx -d $domains_str \
# --pre-hook "sudo systemctl stop nginx" \
# --post-hook "sudo systemctl start nginx"


# jobs.notarecruiter.com,jobs.recruitertrends.com,api.qrhire.net,jobs.qrhire.net,app.qrhire.net,abc.ahriha.me,qrhire.net,ror.ahriha.me


# jobs.notarecruiter.com,jobs.recruitertrends.com,api.qrhire.net,jobs.qrhire.net,qrhire.net,ror.ahriha.me

# certbot install --cert-name api.qrhire.net
