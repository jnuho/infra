#!/bin/bash

kubectl rollout restart deploy/fe-nginx

kubectl get pod -l app=fe-nginx -w