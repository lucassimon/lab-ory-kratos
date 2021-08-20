#!/bin/sh
set -e

export HOME=/home/ory
export IDENTITY_DEFAULT_SCHEMA_URL=file://${HOME}/identity.schema.json
export DSN=${DATABASE_URL_DECODED}
export COURIER_SMTP_CONNECTION_URI=${SMTP_URL}
export LOG_LEVEL=debug

export SERVE_PUBLIC_BASE_URL=${GATEWAY_SVC_URL}/user-svc/public/
export SERVE_ADMIN_BASE_URL=${GATEWAY_SVC_URL}/user-svc/admin/

ls ${HOME}
CONFIG_SOURCE=${HOME}/.kratos-src.yaml
CONFIG_OUTPUT=${HOME}/kratos.yml

envsubst < ${CONFIG_SOURCE} > ${CONFIG_OUTPUT}
cat ${CONFIG_OUTPUT}

kratos "$@"