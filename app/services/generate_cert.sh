#!/bin/bash
domains=($(sudo certbot certificates --cert-name 'api.qrhire.net' | grep Domains | cut -d':' -f2))
domains_str=$(IFS=, eval 'echo "${domains[*]}"')
domains_str=$(echo "$domains_str,$1")
sudo certbot certonly -n --cert-name api.qrhire.net -d $domains_str --agree-tos --nginx --post-hook "sudo systemctl restart nginx"
