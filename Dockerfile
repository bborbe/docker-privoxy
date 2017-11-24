FROM alpine:3.5
MAINTAINER Benjamin Borbe <bborbe@rocketnews.de>

RUN apk add --update ca-certificates privoxy wget ca-certificates bash && rm -rf /var/cache/apk/*

EXPOSE 8118

ENTRYPOINT [""]
CMD ["privoxy","--no-daemon","--user","privoxy","/etc/privoxy/config"]
