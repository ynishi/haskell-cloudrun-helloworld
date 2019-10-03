#!/bin/sh

set -eux

# gcloud config set run/region $REGION

gcloud beta run deploy --image gcr.io/$PROJECT_ID/helloworld --platform managed
