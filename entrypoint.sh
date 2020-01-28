#!/bin/bash

#This file retrieves GKE credentials and submits an Argo Workflow on K8s

set -e

function check_env() {
    if [ -z $(eval echo "\$$1") ]; then
        echo "Variable $1 not found.  Exiting..."
        exit 1
    fi
}

check_env "KUBEFLOW_URL"
check_env "CLIENT_ID"
check_env "PIPELINE_CODE_PATH"
check_env "PIPELINE_FUNCTION_NAME"

python main.py --pipeline_function_name=$PIPELINE_FUNCTION_NAME  \
               --pipeline_code_path=$PIPELINE_CODE_PATH \
               --kubeflow_url=$KUBEFLOW_URL \
               --client_id=$CLIENT_ID