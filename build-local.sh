#!/bin/bash

# multi stage builder
docker build --target builder -t builder .

# multi stage to use
docker build --cache-from builder -t haskell-cloudrun-helloworld .
