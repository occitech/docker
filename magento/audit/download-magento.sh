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
MAGE_URL=https://github.com/bragento/magento-core/archive/${MAGE_VERSION}.zip

echo "Downloading Magento " $MAGE_VERSION
echo $MAGE_URL

if [ ! -e ${DEST} ]
then
  wget --no-check-certificate $MAGE_URL \
    && unzip -q ${MAGE_VERSION}.zip && rm -rf ${MAGE_VERSION}.zip && mv magento-core-${MAGE_VERSION} $DEST
fi
