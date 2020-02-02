#!/usr/bin/env bash

kubectl set image deployment/helloworld-upgrade helloworld=helloworld:5 --record --namespace=dev

#starting with version 1.15
kubectl rollout restart deploy helloworld-upgrade --namespace=dev

kubectl patch deployment helloworld-upgrade -p \
  "{\"spec\":{\"template\":{\"metadata\":{\"labels\":{\"date\":\"`date +'%s'`\"}}}}}"