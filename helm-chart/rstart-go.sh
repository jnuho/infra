#!/bin/bash

kubectl rollout restart deploy/be-go

kubectl get pod -l app=be-go -w