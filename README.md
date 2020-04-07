A simple mail relay configuration.

Environement Variables :
mxbck_myhostname : 	name (fqdn) of you machine
mxbck_relay_domains :	name of the DOMAIN to be relayed
mxbck_cert :		method to get TLS certificates (certbot)
mxbck_certbot_mail :	mail address (used by certbot for communication)

A Volume is required, used to store certbot certificates. To be mounted in /config

Example:
docker run -p 25:25 -p 80:80  --name mx-backup -d --volume /app/mx-backup/config:/config -e mxbck_myhostname=machine.local.domain -e mxbck_relay_domains=local.domain -e mxbck_cert=certbot -e mxbck_certbot_mail=admin@where.ever ofthesun9/mx-backup
