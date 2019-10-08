#!/bin/bash

TARGET_ENVIRONMENT=$1

function usage {
  echo ""
  echo "usage:"
  echo "./redeploy.sh {target-environment}"
  echo ""
  echo "examples:"
  echo "./redeploy.sh dev"
  echo "./redeploy.sh prod"
  echo ""
  exit 99
}


if [[ -z "${TARGET_ENVIRONMENT}" ]]; then
  usage
fi

echo "stopping container flask-app"
docker stop flask-app  || echo "no such container..."
docker rm flask-app    || echo "no such container..."
docker run -e TARGET_ENVIRONMENT=${TARGET_ENVIRONMENT} --name flask-app -d -p 5000:5000 chenchuk/flask-app:1.0
sleep 1s
echo "checking container web service at localhost:5000"
curl http://localhost:5000
