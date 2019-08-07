#!/bin/sh

rm -f /etc/ssh/ssh_host_* || echo ""

ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa
ssh-keygen -f /etc/ssh/ssh_host_ed25519_key -N '' -t ed25519

mkdir -p /root/.ssh
rm /root/.ssh/authorized_keys || echo ""
cp ${AUTHORIZED_KEYS} /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys

/usr/sbin/sshd -D
