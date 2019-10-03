#!/bin/sh

set -eux

gcloud builds submit --tag gcr.io/$PROJECT_ID/helloworld --timeout=1800s
