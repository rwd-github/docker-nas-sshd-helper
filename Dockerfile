FROM alpine:latest
MAINTAINER RWd <rwd-github@gmx.net>

RUN apk add openssh rsync

EXPOSE 22

COPY entrypoint.sh /
CMD ["/entrypoint.sh"]
	

