#!/bin/bash
target_user="user"
container=$1
[ "" == "${container}" ] && container="dev-start-${target_user}"
echo "Stopping docker container ${container}"
# stop dev-start-user
# This is faster:
docker attach ${container} <<EOF
exit
EOF

