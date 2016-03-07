#!/bin/bash
# http://stackoverflow.com/questions/28116315/how-to-do-use-google-container-registry-with-the-docker-cli
#
# eu.gcr.io/divine-arcade-95810/haproxy-srv:latest

gcloud docker -a
docker build -t eu.gcr.io/divine-arcade-95810/haproxy .
docker push eu.gcr.io/divine-arcade-95810/haproxy

