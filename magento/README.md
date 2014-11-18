# Magento images

## Supported tags and respective Dockerfile links

- `php5.3-apache` (_[php5.3/apache/Dockerfile](https://github.com/occitech/docker/blob/master/magento/php5.3/apache/Dockerfile)_)
- `php5.4-apache` (_[php5.4/apache/Dockerfile](https://github.com/occitech/docker/blob/master/magento/php5.4/apache/Dockerfile)_)
- `php5.5-apache` (_[php5.5/apache/Dockerfile](https://github.com/occitech/docker/blob/master/magento/php5.5/apache/Dockerfile)_)

## How to use

Send your Magento sources to `/var/www/html` with a volume, or a `COPY`.

## Features

- [n98-magerun](https://github.com/netz98/n98-magerun) is available in the container
- A wrapper for n98-magerun to help you set the baseUrl (see below)

## Tips & tricks

### Set-up the base URL

```bash
$ docker run --rm occitech/magento:php5.5-apache set-base-url $(docker port $RUNNING_CONTAINER_ID_OR_NAME 80 | sed s/0.0.0.0://) # Only specifying a port for http://127.0.0.1:$PORT/
$ docker run --rm occitech/magento:php5.5-apache set-base-url -c http://my-custom-url/ # -c option for a custom url
```
