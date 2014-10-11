# Magento images

## Available tags

The repo name is `occitech/magento`. Bellow you can find the existing
sets and their corresponding tags

- PHP 5.3
  - Apache 2.2 (_tag `php5.3-apache`_)
- PHP 5.4
  - Apache 2.2 (_tag `php5.4-apache`_)
- PHP 5.5
  - Apache 2.4 (_tag `php5.5-apache`_)

## How to use

Send your Magento sources to `/var/www/htdocs` with a volume.

## Features

- [n98-magerun](https://github.com/netz98/n98-magerun) is available in the container
- A wrapper for n98-magerun to help you set the baseUrl (see below)

## Tips & tricks

### Set-up the base URL

```bash
$ docker run --rm occitech/magento:php5.5-apache set-base-url $(docker port $RUNNING_CONTAINER_ID_OR_NAME 80 | sed s/0.0.0.0://) # Only specifying a port for http://127.0.0.1:$PORT/
$ docker run --rm occitech/magento:php5.5-apache set-base-url -c http://my-custom-url/ # -c option for a custom url
```
