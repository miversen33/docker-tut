FROM ubuntu:latest
# Generally you would use something smaller like debian:12-slim or even better, alpine:latest

COPY ./02-nginx-image-with-logtailing.sh /usr/bin/entrypoint

EXPOSE 80

RUN \
    apt-get update -y > /dev/null &&\
    apt-get install -y nginx > /dev/null &&\
    chmod +x /usr/bin/entrypoint

CMD [ "/usr/bin/entrypoint" ]