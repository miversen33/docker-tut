FROM ubuntu:latest
# Generally you would use something smaller like debian:12-slim or even better, alpine:latest

EXPOSE 80

RUN \
    apt-get update -y > /dev/null &&\
    apt-get install -y nginx > /dev/null

CMD [ "/usr/sbin/nginx", "-g", "daemon off;" ]