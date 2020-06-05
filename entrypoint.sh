#!/bin/bash

set -e
echo "Validating inputs"
if [[ -z "$INPUT_SAM_COMMAND" ]]; then
    echo AWS Stack Name invalid
    exit 1
fi

if [[ -z "$AWS_ACCESS_KEY_ID" ]]; then
    echo AWS Access Key ID invalid
    exit 1
fi

if [[ -z "$AWS_SECRET_ACCESS_KEY" ]]; then
    echo AWS Secret Access Key invalid
    exit 1
fi

if [[ -z "$AWS_REGION" ]]; then
    echo AWS Region invalid
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