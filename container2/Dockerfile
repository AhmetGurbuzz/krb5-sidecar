# syntax=docker/dockerfile:experimental

FROM python:3.8-slim

RUN apt-get update && apt-get install krb5-user libkrb5-dev -y

ENV KRB5_CONFIG=/etc/krb5.conf.d

ADD init.sh /
RUN chmod +x init.sh

ENTRYPOINT ["/init.sh"]
