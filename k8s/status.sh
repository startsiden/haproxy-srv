#!/bin/bash

for i in development qa production
do
  gcloud container clusters get-credentials $i -z europe-west1-d
  kubectl get pods,rc,services --all-namespaces
done

