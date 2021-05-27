#!/bin/bash

# Go this solution from https://forums.docker.com/t/startup-script-after-init-in-centos-7/53483/3

# script set in background
setsid ./set-puppet-conf.sh > output.txt &

# run systemd
exec /usr/sbin/init sshd
