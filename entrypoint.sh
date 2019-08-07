#!/bin/sh

cp -f ${KEYS}/ssh_host_* /etc/ssh/
chown -R root. /etc/ssh
cd /etc/ssh
chmod 600 *_key
chmod 644 *.pub


#ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
#ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa
#ssh-keygen -f /etc/ssh/ssh_host_ed25519_key -N '' -t ed25519

mkdir -p /root/.ssh
cp -f ${KEYS}/authorized_keys /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys

/usr/sbin/sshd -D
