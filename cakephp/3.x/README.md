# CakePHP 3 Docker image

## Supported tags and respective `Dockerfile` links

* `5.6-apache`, `5-apache` (*[php5.6/apache/Dockerfile](https://github.com/occitech/docker/blob/master/cakephp/3.x/php5.6/apache/Dockerfile)*)
* `5.6-fpm`, `5-fpm` (*[php5.6/apache/Dockerfile](https://github.com/occitech/docker/blob/master/cakephp/3.x/php5.6/fpm/Dockerfile)*)
* `nginx` (*[nginx/Dockerfile](https://github.com/occitech/docker/blob/master/cakephp/3.x/nginx/Dockerfile)*)

## What is CakePHP?

CakePHP is an open source web application framework. It follows the Model-View-Controller (MVC) approach and is written in PHP, modeled after the concepts of Ruby on Rails, and distributed under the MIT License.

> http://cakephp.org/

## How to use this image

This image is mainly based on the [official PHP image](https://registry.hub.docker.com/u/library/php/), so we invite you to take a look at it, especially if you need to install specific PHP extensions.

### With Apache

More commonly, you will probably want to run CakePHP in conjunction with Apache httpd. Conveniently, there's a version of the CakePHP image that's packaged with the Apache web server.

You can simply run:

```bash
docker run --name cakephp -d -p 80 occitech/cakephp:5-apache
```

### With PHP-FPM

```bash
docker run --name cakephp -d -p 80 occitech/cakephp:5-fpm
```

As CakePHP has specific URL rewrite rules, we also provide a Nginx image pre-configured with it:

```bash
docker run --name cakephp-fpm -d occitech/cakephp:5-fpm
docker run --name cakephp-nginx --link cakephp-fpm:fpm -d -p 80 occitech/cakephp:nginx
```
