#!/bin/bash
set -o errexit -o pipefail -o nounset

cp -f ${KEYS}/ssh_host_* /etc/ssh/
chown -R root. /etc/ssh
cd /etc/ssh
chmod 600 *_key
chmod 644 *.pub


# Generate Host keys, if required
if ! ls /etc/ssh/ssh_host_* 1> /dev/null 2>&1; then
  ssh-keygen -A
fi

mkdir -p /root/.ssh
cp -f ${KEYS}/authorized_keys /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys

/usr/sbin/sshd -D -e -f /etc/ssh/sshd_config
