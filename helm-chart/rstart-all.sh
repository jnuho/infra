#!/bin/bash

kubectl rollout restart deploy/fe-nginx
kubectl rollout restart deploy/be-go
kubectl rollout restart deploy/be-py

kubectl get pod -w