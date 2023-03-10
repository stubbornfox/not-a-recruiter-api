#!/bin/bash

sudo certbot --nginx -d $1 --quiet --force-renewal
retVal=$?
if [ $retVal -ne 0 ]; then
  echo "Error"
else
  sudo systemctl reload nginx
fi
exit $retVal

# domains=$(sudo certbot certificates --cert-name qrhire.net | grep Domains | cut -d':' -f2 | sed "s/ /,/g")
# domains_str=`echo "$1$domains"`
# echo "e" | sudo certbot certonly -d $domains_str --nginx


# certbot --authenticator standalone --installer nginx -d $domains_str \
# --pre-hook "sudo systemctl stop nginx" \
# --post-hook "sudo systemctl start nginx"


# jobs.notarecruiter.com,jobs.recruitertrends.com,api.qrhire.net,jobs.qrhire.net,app.qrhire.net,abc.ahriha.me,qrhire.net,ror.ahriha.me


# jobs.notarecruiter.com,jobs.recruitertrends.com,api.qrhire.net,jobs.qrhire.net,qrhire.net,ror.ahriha.me

# certbot install --cert-name api.qrhire.net
