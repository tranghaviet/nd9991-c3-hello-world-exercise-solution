#!/bin/bash

# circleci AMI
# AWS_ACCESS_KEY_ID=
# AWS_SECRET_ACCESS_KEY=
# AWS_DEFAULT_REGION=us-east-1

region="us-east-1"
output_format="json"

access_key=""
secret_key=""
session_token=""

# Configure AWS CLI
aws configure set aws_access_key_id "$access_key"
aws configure set aws_secret_access_key "$secret_key"

# Set AWS session token if provided
if [ -n "$session_token" ]; then
    aws configure set aws_session_token "$session_token"
fi

aws configure set region "$region"
aws configure set output "$output_format"

echo "AWS CLI configuration completed."

aws configure list
# aws iam list-users
# aws sts get-caller-identity
