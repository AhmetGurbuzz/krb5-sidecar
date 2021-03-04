#!/bin/bash

[[ "$PERIOD_SECONDS" == "" ]] && PERIOD_SECONDS=3600
[[ "$RETRY_SECONDS" == "" ]] && RETRY_SECONDS=60

while true
do
    if [[ -z "$(ls -A /etc/krb5.conf.d/ccache)" ]]; then
        echo "*** Warning /etc/krb5.conf.d/ccache not found at $(date). Waiting for $RETRY_SECONDS seconds to retry."
        sleep $RETRY_SECONDS
    else
        echo "*** kinit at $(date). Waiting for $PERIOD_SECONDS seconds."
        kinit -R
        klist
        sleep $PERIOD_SECONDS
    fi
done
