#!/bin/bash
domains=$(sudo certbot certificates --cert-name 'api.qrhire.net' | grep Domains | cut -d':' -f2 | sed "s/ /,/g")
domains_str=`echo "$1$domains"`
sudo certbot certonly -n --cert-name api.qrhire.net -d $domains_str --agree-tos --nginx --post-hook "sudo systemctl restart nginx"

