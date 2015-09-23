#!/usr/bin/env bash
if [ -z "$1" ]; then
    echo "Please specify a Magento version number"
    exit 1
fi
MAGE_VERSION=$1
MAGE_ORIG_SRC=/magento_src/$MAGE_VERSION
AUDIT_DEST=/audit

echo "1 - Download Magento"
if [ ! -d "$MAGE_ORIG_SRC" ]; then
  download-magento $MAGE_VERSION $MAGE_ORIG_SRC
fi

echo "2 - Core hacks analysis"
n98-magerun mpmd:corehacks $MAGE_ORIG_SRC $AUDIT_DEST/corehacks.html

echo "3 - Core hacks analysis"
n98-magerun mpmd:codepooloverrides $AUDIT_DEST/overrides.html
