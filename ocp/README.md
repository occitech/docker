# OCP

**UNMAINTAINED** This repository is not maintained anymore, please use <https://github.com/ethersys/ethersys-docker-ocp> and report issues on it.

Minimalist Alpine container to run Optimus Cache Prime (<https://patrickmn.com/projects/ocp/>)

## Usage

To warn you website cache using public sitemap adress

```bash
docker run --rm occitech/ocp -c 10 http://website.com/sitemap.xml
```

Or using a local file

```bash
docker run --rm occitech/ocp -c 10 /var/www/html/sitemap.xml
```

More documentation on <https://patrickmn.com/projects/ocp/>
