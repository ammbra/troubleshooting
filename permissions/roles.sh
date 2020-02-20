#!/usr/bin/env bash
#kubectl config set-credentials ana
#kubectl config set-context managed-context --namespace=dev --user=ana --cluster=docker-desktop
#
#kubectl config use-context managed-context
#kubectl --context=managed-context get pods

kubectl create -f role-deployment-viewer.yaml
kubectl create serviceaccount helloworld-service-account --namespace=dev
kubectl create -f role-binding-deployment-viewer.yaml


kubectl auth can-i list deployment --as=ana --namespace=dev
kubectl auth can-i create deployment --as=ana --namespace=dev







