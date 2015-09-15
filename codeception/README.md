# Docker image for running Codeception

## How to use

Send your test sources to `/tests` with a volume, or a `COPY`.

You can then run any `codecept` command using the image. Here is an example of complex command using docker-compose:

```bash
docker-compose run --rm codeception codecept run -c offline  --steps --no-ansi
```

## Tips & tricks

### Link your tested containers

If you want to run acceptance tests on a real url, you can link containers to codeception in order to access them from your tests.

Here is an example using docker-compose:

```yml
codeception:
  image: occitech/codeception
  links:
    - web:site.test
    - web:en.site.test
  volumes:
    - .:/tests
```
