#!/bin/bash

kubectl rollout restart deploy/be-py

kubectl get pod -l app=be-py -w