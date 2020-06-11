#!/usr/bin/env bash
#kubectl config set-credentials ana
#kubectl config set-context managed-context --namespace=dev --user=ana --cluster=docker-desktop
#
#kubectl config use-context managed-context
#kubectl --context=managed-context get pods

####service account troubleshooting
kubectl apply -f install.yaml -n dev
kubectl describe deployment -n dev
kubectl rollout status deployment/helloworld-withaccount -n dev
kubectl apply -f role-helloworld-serviceccount.yaml -n dev
kubectl apply -f role-binding-deployment-serviceaccount.yaml -n dev
kubectl apply -f helloworld-serviceaccount.yaml -n dev
kubectl rollout restart deployment/helloworld-withaccount -n dev

####user creation
kubectl create -f role-deployment-viewer.yaml
kubectl create -f role-binding-deployment-viewer.yaml


kubectl auth can-i list deployment --as=ana --namespace=dev
kubectl auth can-i create deployment --as=ana --namespace=dev







