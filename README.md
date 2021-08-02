![CI](https://github.com/aaronhmiller/just-httpie/workflows/CI/badge.svg)

# just-httpie

### Usage:
`docker run --rm saltaaron/just-httpie https://httpbin.org/anything` (add `--pretty all` flag if you want formatted output)

```
  PLANET=$(docker run -i --network host saltaaron/just-httpie :5000/planets/3 -b | docker run -i --network host saltaaron/just-jq -r .name)
  if [ $PLANET != 'Earth' ] ; then
    ...
```

### Design
To match the default output of the httpie executable, `--print=hb` (print response header and body) has been added.

### Building
To build for multiple platforms, start the buildx container: `docker buildx create --use`

To tag, build, and push for multiple platforms:`docker buildx build --platform linux/amd64,linux/arm64 -t <your_docker_hub_account>/just-httpie --push .`
