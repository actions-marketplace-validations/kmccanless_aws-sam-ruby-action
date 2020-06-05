#!/bin/bash

set -e
echo "Validating inputs"
if [[ -z "$INPUT_SAM_COMMAND" ]]; then
    echo "AWS SAM command invalid"
    exit 1
fi

if [[ -z "$AWS_ACCESS_KEY_ID" ]]; then
    echo "AWS Access Key ID invalid"
    exit 1
fi

if [[ -z "$AWS_SECRET_ACCESS_KEY" ]]; then
    echo "AWS Secret Access Key invalid"
    exit 1
fi

if [[ -z "$AWS_REGION" ]]; then
    echo "AWS Region invalid"
    exit 1
fi
if [[ -z "$STACK_NAME" ]]; then
    echo "Stack Name Invalid"
    exit 1
fi
if [[ -z "$S3_BUCKET" ]]; then
    echo "S3 Bucket Invalid"
    exit 1
fi
if [[ -z "$CAPABILITIES" ]]; then
    echo "Capabilities Invalid"
    exit 1
fi
echo "setting up ruby"
exec $SHELL -l
rbenv local 2.7.0

cd
if [ "${INPUT_SAM_COMMAND}" == "build" ]; then
		echo "Running sam build"
		sam build
fi

if [ "${INPUT_SAM_COMMAND}" == "deploy" ]; then
		echo "Running sam build"
		sam deploy --stack-name "${STACK_NAME}" --s3-bucket "${S3_BUCKET}" --capabilities "${CAPABILITIES}"
fi