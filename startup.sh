#!/bin/bash

# Override Postfix configuration
if [ -f /config/main.cf ] 
then
  cp /config/main.cf /etc/postfix/main.cf
  echo "/config/main.cf copied"
fi

if [[ -n $mxbck_myhostname ]]
then
	echo "Congiguring myhostname="$mxbck_myhostname
	postconf -e myhostname=$mxbck_myhostname
else
	echo "mxbck_myhostname is not set"
fi

if [[ -n $mxbck_relay_domains ]]
then
	echo "Configuring relay_domains="$mxbck_relay_domains
	postconf -e relay_domains=$mxbck_relay_domains
else
	echo "mxbck_relay_domains is not set"
fi

case $mxbck_cert in
	"certbot")
		/run_certbot.sh
		bhyve_exit=$?
		if [ $bhyve_exit -ne 0 ]
		then
        		echo "Issuing certificate failed"
			exit 1
		else
			echo "certbot Ok"
			cp /run_certbot.sh /etc/periodic/daily/
			crond
		fi
		;;
	*)
		echo "certbot configuration needed"
		exit 1
		;;
esac



postfix start-fg


