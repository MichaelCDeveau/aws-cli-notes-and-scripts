#!/usr/bin/env bash
# Describe EC2 instances in the current region

set -euo pipefail

aws ec2 describe-instances \
  --query 'Reservations[].Instances[].{Id:InstanceId,Type:InstanceType,State:State.Name,Name:Tags[?Key==`Name`].Value | [0]}' \
  --output table
