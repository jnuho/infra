#!/bin/bash

if [ "$(kubectl config current-context)" = "minikube" ]; then
    minikube addons enable ingress
fi

#sleep 1


# Define ingress routing rule
if [ "$(kubectl config current-context)" = "minikube" ]; then
    kubectl port-forward -n ingress-nginx svc/ingress-nginx-controller 8080:80
elif [ "$(kubectl config current-context)" = "pi" ]; then
    kubectl port-forward -n ingress-nginx svc/ingress-nginx-controller 8080:80
fi


