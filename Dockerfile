FROM alpine:latest
MAINTAINER RWd <rwd-github@gmx.net>

RUN apk update \
	&& apk upgrade \
	&& apk add openssh rsync bash nano \
	&& rm -rf /var/cache/apk/* /tmp/*

RUN echo -e "Port 22\n" >> /etc/ssh/sshd_config \
	&& echo -e "PasswordAuthentication no\n" >> /etc/ssh/sshd_config \
	&& echo -e "ChallengeResponseAuthentication no\n" >> /etc/ssh/sshd_config \
	&& echo -e "PermitRootLogin yes\n" >> /etc/ssh/sshd_config \
	&& passwd -u root
	
EXPOSE 22

ENV SSHKEYS= 

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
	
