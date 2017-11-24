FROM alpine:3.5
MAINTAINER Benjamin Borbe <bborbe@rocketnews.de>

RUN apk add --update \
	ca-certificates \
	privoxy \
	ca-certificates \
	bash \
	&& rm -rf /var/cache/apk/*

COPY files/entrypoint.sh /usr/local/bin/entrypoint.sh
COPY files/privoxy.conf /etc/privoxy/config

EXPOSE 8118

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["privoxy","--no-daemon","--user","privoxy","/etc/privoxy/config"]
