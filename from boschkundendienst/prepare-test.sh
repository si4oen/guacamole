#!/bin/sh
#
echo "Preparing folder init and creating ./init/initdb.sql"
mkdir -p ./guacamole/init >/dev/null 2>&1
mkdir -p ./nginx/ssl >/dev/null 2>&1
chmod -R +x ./guacamole/init
docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --postgres > ./guacamole/init/initdb.sql
echo "done"
echo "Creating SSL certificates"
openssl req -nodes -newkey rsa:2048 -new -x509 -days 365 -keyout nginx/ssl/self-ssl.key -out nginx/ssl/self.cert -subj '/C=VN/ST=HCM/L=HCM/O=TESTLAB/OU=TESTLAB/CN=ntd.ddns.info/emailAddress=abc@ntd.info'
echo "You can use your own certificates by placing the private key in nginx/ssl/self-ssl.key and the cert in nginx/ssl/self.cert"
echo "done"
