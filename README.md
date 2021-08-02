[![CI](https://github.com/aaronhmiller/just-httpie/workflows/CI/badge.svg)](https://github.com/aaronhmiller/just-httpie/actions)

# just-httpie

### Usage:
`docker run --rm saltaaron/just-httpie https://httpbin.org/anything` (add `--pretty all` flag if you want formatted output and add `--print hb` if you want both response header and body output)

```
  PLANET=$(docker run --network host saltaaron/just-httpie :5000/planets/3 | docker run -i --network host saltaaron/just-jq -r .name)
  if [ $PLANET != 'Earth' ] ; then
    ...
```

### Design
just-httpie is intended to be used as a CLI pipeline tool and its flags are streamlined for that purpose. To match the default output of the httpie executable, you'll want to add `--pretty all --print hb` (apply formatting and print response header and body).

### Building
To build for multiple platforms, start the buildx container: `docker buildx create --use`

To tag, build, and push for multiple platforms:`docker buildx build --platform linux/amd64,linux/arm64 -t <your_docker_hub_account>/just-httpie --push .`
