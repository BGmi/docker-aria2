FROM alpine:3.13
VOLUME /downloads
EXPOSE 6800

RUN apk add --update --no-cache aria2 && rm -rf /var/cache/apk/*

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD aria2c --conf-path=/etc/aria2.conf
