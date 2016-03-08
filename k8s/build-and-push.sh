#!/bin/bash
# http://stackoverflow.com/questions/28116315/how-to-do-use-google-container-registry-with-the-docker-cli
#
# eu.gcr.io/divine-arcade-95810/haproxy-srv:latest

gcloud docker -a
docker build -t eu.gcr.io/divine-arcade-95810/haproxy ..
docker push eu.gcr.io/divine-arcade-95810/haproxy

for i in development qa production
do
  gcloud container clusters get-credentials $i -z europe-west1-d
  kubectl replace -f rc.yaml
  kubectl apply -f service-$i.yaml
done
# tips and tricks
# gcloud container clusters get-credentials development -z europe-west1-d
# kubectl get pods,rc,services --all-namespaces

echo
echo STATUS:
echo
for i in development qa production
do
  gcloud container clusters get-credentials $i -z europe-west1-d
  kubectl get pods,rc,services --all-namespaces
done


