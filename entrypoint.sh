#!/bin/sh
set -e

# first arg is `-f` or `--some-option`
# or first arg is `something.conf`
if [ "${1#-}" != "$1" ] ; then
	set -- kubebuilder "$@"
fi

exec "$@"