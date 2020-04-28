![CI](https://github.com/aaronhmiller/just-httpie/workflows/CI/badge.svg)

# just-httpie

* To build use `$ docker build - < DOCKERFILE_HERE`
* To tag and build `$ docker build -t kongaaron/just-httpie:2.1.1 -t kongaaron/just-httpie:latest .` (assumes Dockerfile in current directory)
* Once you tag and build, to upload `$ docker push kongaaron/just-httpie`

## Usage:
`docker run --rm kongaaron/just-httpie https://httpbin.org/anything`

## Design
Because this container is expected to be executed, the newest version adds `--ignore-stdin` and because pretty nicer than otherwise to read, `--pretty=all` has been added. To match the default output of the httpie executable, `--print=hb` (print response header and body) has also been added.
