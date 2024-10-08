#!/bin/bash

APP=fe-nginx

# Get the name of the first running pod
POD_NAME=$(kubectl get pods --selector=app=$APP --output=jsonpath='{.items[0].metadata.name}')

# Check if a pod name was found
if [ -z "$POD_NAME" ]; then
  echo "No $APP pod found."
  exit 1
fi

# Execute into the pod
kubectl exec -it $POD_NAME -- /bin/sh