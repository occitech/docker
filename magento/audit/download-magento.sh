#!/usr/bin/env bash
if [ -z "$1" ]; then
    echo "Please specify a Magento version number"
    exit 1
fi

if [ -z "$2" ]; then
    echo "Please specify a destination"
    exit 1
fi

MAGE_VERSION=$1
DEST=$2
MAGE_URL=https://github.com/bragento/magento-core/archive/${MAGE_VERSION}.tar.gz

echo "Downloading Magento " $MAGE_VERSION
echo $MAGE_URL

if [ ! -e ${DEST} ]
then
  mkdir -p ${DEST} \
    && wget --no-check-certificate -qO- ${MAGE_URL} | tar xz -C ${DEST} --strip 1
fi
