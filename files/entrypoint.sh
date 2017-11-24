#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace

ulimit -n 8192

if [ "$1" = 'privoxy' ]; then
	chown -R privoxy /etc/privoxy
	echo "starting privoxy $@"
fi

exec "$@"
