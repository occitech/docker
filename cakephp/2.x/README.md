# CakePHP 2.x images

## Available tags

The repo name is `occitech/cakephp2`. Bellow you can find the existing
sets and their corresponding tags

- PHP 5.5
  - Apache 2.4 (_tag `php5.5-apache`_)

## How to use

Send your CakePHP sources to `/var/www/` with a volume.

Then run a container with a `CAKEPHP_WEBROOT` env var. `CAKEPHP_WEBROOT` must
lead to the webroot of your CakePHP __in your container__ (i.e. `/var/www/app/webroot`).

## Features

- [composer](https://getcomposer.org/) is available in the container
