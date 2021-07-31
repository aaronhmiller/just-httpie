![CI](https://github.com/aaronhmiller/just-httpie/workflows/CI/badge.svg)

# just-httpie

### Usage:
`docker run --rm saltaaron/just-httpie https://httpbin.org/anything`

If using within a CI/CD flow, add the `--pretty=none` flag to avoid unexpected control characters:
```
  PLANET=$(docker run -i --network host saltaaron/just-httpie :5000/planets/3 --pretty=none -b | docker run -i --network host saltaaron/just-jq -r .name)
  if [ $PLANET != 'Earth' ] ; then
    ...
```

### Design
Because this container is expected to be executed, the newest version adds `--ignore-stdin` and because pretty nicer than otherwise to read, `--pretty=all` has been added. To match the default output of the httpie executable, `--print=hb` (print response header and body) has also been added.

### Building
To build for multiple platforms, start the buildx container: `docker buildx create --use`

To tag, build, and push for multiple platforms:`docker buildx build --platform linux/amd64,linux/arm64 -t <your_docker_hub_account>/just-httpie --push .`
