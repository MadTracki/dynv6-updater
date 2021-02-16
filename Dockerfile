FROM alpine:latest

RUN apk update && apk add \
    bash \
    grep \
    && rm -rf /var/cache/apk/*

RUN echo "*	*	*	*	*	run-parts /etc/periodic/1min" >> /etc/crontabs/root

RUN mkdir /dynv6
RUN mkdir /etc/periodic/1min
RUN mkdir /root/current_ip

ADD ./dynv6/ /dynv6/
RUN chmod 0755 /dynv6/*

RUN mv /dynv6/dynv6 /etc/periodic/1min

ENTRYPOINT ["/dynv6/entrypoint.sh"]
