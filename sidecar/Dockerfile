# syntax=docker/dockerfile:experimental

FROM python:3.8-slim

RUN mkdir /etc/krb5.conf.d
ADD krb5.conf /etc/krb5.conf.d
ENV KRB5_CONFIG=/etc/krb5.conf.d
RUN apt-get update && apt-get install krb5-user libkrb5-dev -y

VOLUME ["/etc/krb5.conf.d"]

RUN --mount=type=secret,id=client.keytab,dst=/etc/krb5.conf.d/client.keytab kinit -kt /etc/krb5.conf.d/client.keytab client@HADOOP.COM

ADD rekinit.sh /
RUN chmod +x rekinit.sh

ENTRYPOINT ["/rekinit.sh"]
