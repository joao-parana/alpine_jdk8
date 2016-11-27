#!/bin/bash

set -e

export HUB_USER_NAME=parana

echo "••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••"

docker build -t $HUB_USER_NAME/alpine_jdk8 .

