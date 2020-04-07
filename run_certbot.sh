#!/bin/bash
certbot certonly --standalone --test-cert --reuse-key --agree-tos --keep-until-expiring --config-dir /config/certs --cert-name mxbck -m $mxbck_certbot_mail -d $mxbck_myhostname
