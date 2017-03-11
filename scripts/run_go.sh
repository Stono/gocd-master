#!/bin/bash
set -e
PLUGIN_DIR=/var/lib/go-server/plugins/external
mkdir -p $PLUGIN_DIR

if [ -f "/etc/gocd-ssh/ssh-privatekey" ]; then
  echo Copying public and private keys
  mkdir -p /var/go/.ssh
  cp /etc/gocd-ssh/ssh-privatekey /var/go/.ssh/id_rsa
  cp /etc/gocd-ssh/ssh-publickey /var/go/.ssh/id_rsa.pub
  echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> /var/go/.ssh/config
  chmod 0700 /var/go/.ssh
  chmod 0600 /var/go/.ssh/id_rsa
  chmod 0600 /var/go/.ssh/config
  chmod 0644 /var/go/.ssh/id_rsa.pub
fi

echo Fixing Permissions
chown -R go:go $PLUGIN_DIR
chown -R go:go /etc/go
chown -R go:go /var/log/go-server
chown -R go:go /var/lib/go-server
chown -R go:go /var/go

echo Linking users file
ln -sf /etc/go-files/users /etc/go-users

echo Fixing log problem
# Fix bug with logs, see https://github.com/gocd/gocd/issues/3246
RUN ln -sf /var/log/go-server/go-server.out.log /var/log/go-server/go-server.log

echo Starting go...
/sbin/my_init
