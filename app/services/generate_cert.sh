#!/bin/bash
domains=$(sudo certbot certificates --cert-name qrhire.net | grep Domains | cut -d':' -f2 | sed "s/ /,/g")
domains_str=`echo "$1$domains"`
echo "e" | sudo certbot certonly -d $domains_str --nginx
