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

n98-magerun --skip-root-check cache:c

echo "2 - Core hacks analysis"
n98-magerun --skip-root-check mpmd:corehacks $MAGE_ORIG_SRC $AUDIT_DEST/corehacks.html

echo "3 - Local overrides analysis"
n98-magerun --skip-root-check mpmd:codepooloverrides $AUDIT_DEST/overrides.html

echo "4 - Extensions analysis"
n98-magerun --skip-root-check dev:module:list > $AUDIT_DEST/extensions.txt

echo "5 - Rewrites & conflicts analysis"
echo "All Rewrites" > $AUDIT_DEST/rewrites.txt
n98-magerun --skip-root-check dev:module:rewrite:list >> $AUDIT_DEST/rewrites.txt
echo "Rewrite conflicts" >> $AUDIT_DEST/rewrites.txt
n98-magerun --skip-root-check dev:module:rewrite:conflicts >> $AUDIT_DEST/rewrite-conflicts.txt

echo "6 - Gather further statistics"
echo "Magento system info:" > $AUDIT_DEST/stats.txt
n98-magerun --skip-root-check sys:info >> $AUDIT_DEST/stats.txt
echo "Reports count:" >> $AUDIT_DEST/stats.txt
n98-magerun --skip-root-check dev:report:count >> $AUDIT_DEST/stats.txt
