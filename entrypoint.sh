#!/bin/ash

# generate host keys (if not present)
if [ -z "$(ls -A /etc/ssh/host_keys)" ]; then
  echo "Generating new host keys ..."
  ssh-keygen -A
  mv -n /etc/ssh/ssh_host_* /etc/ssh/host_keys/
  rm -f /etc/ssh/ssh_host_*
fi

password="$(head /dev/urandom | sha512sum | cut -d ' ' -f 1 | cut -c 1-10)"
echo "assistance:$password" | chpasswd
echo ''
echo '***'
echo "Connect using login assistance and password $password"
echo '***'
echo ''

# do not detach (-D), log to stderr (-e)
exec /usr/sbin/sshd -D -e
