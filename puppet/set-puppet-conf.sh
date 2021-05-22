#!/bin/sh

if [[ -z $PUPPETSERVER ]]; then
    PUPPETSERVER='puppet'
fi

if [[ -z $PUPPETCLIENT ]]; then
    PUPPETCLIENT=$HOSTNAME
    if [[ -z $PUPPETCLIENT ]]; then
        PUPPETCLIENT=$(hostname)
        if [[ -z $PUPPETCLIENT ]]; then
            PUPPETCLIENT='puppetclient'
        fi
    fi
fi

echo "[main]
certname = ${PUPPETCLIENT}
server = ${PUPPETSERVER}" >> /etc/puppetlabs/puppet/puppet.conf
