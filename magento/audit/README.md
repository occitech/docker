# Docker image for auditing Magento

This image allows you tou run an audit of a magento code.

TODO Document what it does, and link to the blog post (yet to be written ;))

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