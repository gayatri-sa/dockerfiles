#!/bin/sh

# generate host keys if not present
ssh-keygen -A

# needed for systemctl to work
mkdir /run/systemd/system
/usr/lib/systemd/systemd --system &

# do not detach (-D), log to stderr (-e), passthrough other arguments
exec /usr/sbin/sshd -D -e "$@"
