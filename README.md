[![CI](https://github.com/aaronhmiller/just-httpie/workflows/CI/badge.svg)](https://github.com/aaronhmiller/just-httpie/actions)
[![Docker Hub CI](https://github.com/aaronhmiller/just-httpie/actions/workflows/docker-hub-ci.yaml/badge.svg)](https://github.com/aaronhmiller/just-httpie/actions/workflows/docker-hub-ci.yaml)

# just-httpie

### Usage:
`docker run --rm saltaaron/just-httpie GET https://httpbin.org/anything` (add `--pretty all` flag if you want formatted output and add `--print hb` if you want both response header and body output)

Should you need to receive piped input, you'll need to add Docker's `-i/--interactive` flag. For example:
```
  PLANET=$(docker run --network host saltaaron/just-httpie GET :5000/planets/3 | docker run -i --network host saltaaron/just-jq -r .name)
  if [ $PLANET != 'Earth' ] ; then
    ...
```
should you need to shell into the container, override the entrypoint and run it like this: `docker run --entrypoint /bin/sh --rm -it saltaaron/just-httpie`

### Implementation note

Because we are running it from Docker, relying on the default HTTPie behaviors of detecting GET and POST doesn't align with more standard usage. For this reason, it's best to be explicit about the desired behavior for METHOD. Adding `--ignore-stdin` to the ENTRYPOINT was considered, but then chaining usage together wouldn't work, so it was left off.

### Design
just-httpie is intended to be used as a CLI pipeline tool and its flags are streamlined for that purpose. To match the default output of the httpie executable, you'll want to add `--pretty all --print hb` (apply formatting and print response header and body).

### Building
To build for multiple platforms, start the buildx container: `docker buildx create --use`

To tag, build, and push for multiple platforms:`docker buildx build --platform linux/amd64,linux/arm64 -t <your_docker_hub_account>/just-httpie --push .`
