# Docker image for auditing Magento

This image allows you tou run an audit of a magento code.

## What does it do ?

It generates different files thanks to [N98-Magerun](https://github.com/netz98/n98-magerun) and [Magento Project Mess Detector (MPMD)](https://github.com/AOEpeople/mpmd) to simplify the audit process.

Indeed it will generate files which contain listing of
* core hacks
* overrides
* rewrite-conflicts

It will also generate some statistics about the audited magento

To learn more, we wrote a post about it :
[http://www.occitech.fr/blog/2016/01/auditer-magento-en-quelques-heures/ (french)](http://www.occitech.fr/blog/2016/01/auditer-magento-en-quelques-heures/)

## Usage

You must call the `do-audit` executable with the Magento version number of your project. For instance : `do-audit 1.9.2.1`, or `do-audit 1.7.0.2`

```bash
docker run --rm --link=container_with_your_db:db \
	-v $(pwd)/htdocs:/project \
	-v $(pwd)/magento_src:/magento_src \
	-v $(pwd)/audit:/audit \
	occitech/magento-audit do-audit 1.9.2.1
```

Volumes:

* `/project`: the source code to be analyzed (top level of a Magento install, with `index.php`)
* `/magento_src`: where magento original sources will be downloaded. We recommend mounting it to prevent downloading the whole magento archive on each run.
* `/audit`: where audit files will be written

## Supported Magento Version

* 1.6.0.2
* 1.7.0.2
* 1.8.1.0
* 1.9.0.1
* 1.9.1.0
* 1.9.1.1
* 1.9.2.0
* 1.9.2.1
* 1.9.2.2
