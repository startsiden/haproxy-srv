for i in development|qa|production; do gcloud container clusters get-credentials $i -z europe-west1-d && kubectl replace -f rc-$i.yaml; done
