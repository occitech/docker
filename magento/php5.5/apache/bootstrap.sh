#!/usr/bin/env bash

portLinkedTo80=$(docker ps -a | grep ${MAGENTO_APACHE_CONTAINER_NAME} | grep -o -P "[0-9]+\->80" | tr "\->" "\n" | head -n 1)
baseUrl="http://127.0.0.1:${portLinkedTo80}/"

magentoRootDir=/var/www
localXml="${magentoRootDir}/app/etc/local.xml"

if test -f ${localXml}; then
  rm ${localXml}

  /usr/bin/n98-magerun --root-dir=${magentoRootDir} local-config:generate ${!MAGENTO_DATABASE_IP_ADDR_ENV} root root magento files ${MAGENTO_ADMIN_NAME} >/dev/null 2>&1
  /usr/bin/n98-magerun --root-dir=${magentoRootDir} config:set web/unsecure/base_url ${baseUrl} >/dev/null 2>&1
  /usr/bin/n98-magerun --root-dir=${magentoRootDir} config:set web/secure/base_url ${baseUrl} >/dev/null 2>&1
else
  /usr/bin/n98-magerun install --installationFolder=${magentoRootDir} --noDownload --dbHost=${!MAGENTO_DATABASE_IP_ADDR_ENV} --dbUser=root --dbPass=root --dbPort=3306 --dbName=magento --baseUrl=${baseUrl} >/dev/null 2>&1

  /usr/bin/n98-magerun --root-dir=${magentoRootDir} local-config:generate ${!MAGENTO_DATABASE_IP_ADDR_ENV} root root magento files ${MAGENTO_ADMIN_NAME} >/dev/null 2>&1
  /usr/bin/n98-magerun --root-dir=${magentoRootDir} cache:clean >/dev/null 2>&1
  /usr/bin/n98-magerun --root-dir=${magentoRootDir} cache:flush >/dev/null 2>&1
fi

sh /init.sh "$@"
