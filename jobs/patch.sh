#!/usr/bin/env bash
kubectl patch cronjob <name> -p '{"spec": { "suspend": true }}'

kubectl patch cronjob great-helloworld-job -p '{"spec": { "suspend": true }}'
kubectl patch cronjob great-helloworld-job -p '{"spec": { "schedule": "* * 30 2 *" }}'

