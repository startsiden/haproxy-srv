#!/bin/bash
# http://stackoverflow.com/questions/28116315/how-to-do-use-google-container-registry-with-the-docker-cli
#
# eu.gcr.io/divine-arcade-95810/haproxy-srv:latest

gcloud docker -a
docker build -t eu.gcr.io/divine-arcade-95810/haproxy .
docker push eu.gcr.io/divine-arcade-95810/haproxy

# tips and tricks
# 1233  07/03/16 14:42:14 kubectl get pods  --all-namespaces
# 1235  07/03/16 14:48:53 kubectl get rc,services --all-namespaces
# 1236  07/03/16 14:49:01 kubectl get rc,services --namespace=kube-system
# 1237  07/03/16 14:55:21 gcloud container clusters get-credentials qa -z europe-west1-d

for i in development qa production
do
  gcloud container clusters get-credentials $i -z europe-west1-d
  kubectl replace -f rc.yaml
  kubectl replace -f service-$i.yaml
done
