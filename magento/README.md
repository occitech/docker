# Magento images

## Available tags

The repo name is `occitech/magento`. Bellow you can find the differents existing
sets and their corresponding tags

- PHP 5.3
  - Apache 2.2 (_tag `php5.3-apache`_)
- PHP 5.4
  - Apache 2.2 (_tag `php5.4-apache`_)
- PHP 5.5
  - Apache 2.4 (_tag `php5.5-apache`_)

## Features

If this is the first time you run your Magento (i.e. there is no `app/etc/local.xml` file)
the database will be created and initialized.

After that, or if a `app/etc/local.xml` file was already present, the container
will generate the `app/etc/local.xml` for you each time you start
it. This way, you won't have to manually change the `<host/>` that will
change after every restart of your database container.

In the same way, the `web/unsecure/base_url` and `web/secure/base_url` will be set
according to the port linked to the port `80` of the container, so you won't be
redirected everytime you restart your magento container.

[n98-magerun](https://github.com/netz98/n98-magerun) is available in the container.

### Bonus

As this image is inheriting from `occitech/php`, [mailcatcher](https://github.com/sj26/mailcatcher)
is available on port `1080`.

## How to use

To make the magic happen, you'll just need some volumes shared and a handful of
environment variables.

### Volumes

Send your Magento sources to `/var/www`.

Send your Docker socket to `/var/run/docker.sock` (so the container can
inspect which ports are binded).

### Environment variables

- `MAGENTO_DATABASE_IP_ADDR_ENV`: the name of the environment variable containing
the database IP
- `MAGENTO_APACHE_CONTAINER_NAME`: the name of the Magento container
- `MAGENTO_ADMIN_NAME`: the admin frontend name (used for `app/etc/local.xml` generation).
