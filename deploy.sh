#!/bin/bash

# Exit on any error
set -e

sudo /opt/google-cloud-sdk/bin/gcloud docker push us.gcr.io/${PROJECT_NAME}/subsonic
sudo chown -R ubuntu:ubuntu /home/ubuntu/.kube
kubectl patch deployment subsonic -p '{"spec":{"template":{"spec":{"containers":[{"name":"subsonic","image":"us.gcr.io/kubernetes-1369/subsonic:'"$CIRCLE_SHA1"'"}]}}}}'