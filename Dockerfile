FROM python:3.8-alpine as builder

# Install and compile Datasette + its dependencies
RUN apk --update add --no-cache g++ && pip install --upgrade httpie

# Now build a fresh container, copying across the compiled pieces
FROM python:3.8-alpine

COPY --from=builder /usr/local/lib/ /usr/local/lib/
COPY --from=builder /usr/local/bin/ /usr/local/bin/

ENTRYPOINT [ "http" ]
