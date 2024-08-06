#!/bin/sh

set -e

mkdir -p ~/.aws
touch ~/.aws/credentials

SPACE_DEST=${SPACE_DEST:-""}

echo "[default]
aws_access_key_id = ${SPACE_ACCESS_KEY_ID}
aws_secret_access_key = ${SPACE_SECRET_ACCESS_KEY}" > ~/.aws/credentials

aws s3 rm --recursive s3://${SPACE_NAME}/${SPACE_DEST} \
            --endpoint https://${SPACE_REGION}.digitaloceanspaces.com
aws s3 cp --recursive ${SOURCE_DIR} s3://${SPACE_NAME}/${SPACE_DEST} \
            --follow-symlinks \
            --endpoint https://${SPACE_REGION}.digitaloceanspaces.com $*

rm -rf ~/.aws
