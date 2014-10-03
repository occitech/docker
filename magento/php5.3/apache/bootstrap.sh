#!/usr/bin/env bash

magentoRootDir=/var/www
localXml="${magentoRootDir}/app/etc/local.xml"

if test -f $localXml; then
  rm $localXml
fi

/usr/bin/n98-magerun --root-dir=${magentoRootDir} local-config:generate ${MPSEC_DB_1_PORT_3306_TCP_ADDR} root root mpsec files admin >/dev/null

portLinkedTo80=$(docker ps -a | grep mpsec_web_1 | grep -o -P "[0-9]+\->80" | tr "\->" "\n" | head -n 1)
baseUrl="http://127.0.0.1:${portLinkedTo80}/"
/usr/bin/n98-magerun --root-dir=${magentoRootDir} config:set web/unsecure/base_url ${baseUrl} >/dev/null
/usr/bin/n98-magerun --root-dir=${magentoRootDir} config:set web/secure/base_url ${baseUrl} >/dev/null

sh /init.sh "$@"
