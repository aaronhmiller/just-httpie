FROM alpine:latest
  
RUN apk add --no-cache python3 py3-pip && \
    pip3 install --upgrade requests httpie && \
    rm -rf /root/.cache && rm -rf /var/cache/apk/* 

ENTRYPOINT [ "http" ]
