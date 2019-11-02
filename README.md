# Intructions to Run this sample
**Disclaimer**: Docker Desktop was used for this sample. 



## Deploying
Please go to /volumes folder.

* Create the persistent volumes (PV) and the persistent volume claims(pvc):
```sh
   kubectl apply -f backup-volume.yaml --namespace=<namespace>
   kubectl apply -f upload-volume.yaml --namespace=<namespace>
```
* The correct example for mounting the volumes is in helper.yaml.
```sh
   kubectl apply -f helper.yaml --namespace=<namespace>
   ###you can also copy the exec.sh script inside the upload volume.
   ####get the pod created by helper
   kubectl get pods --namespace=<namespace>
   kubectl cp exec.sh <helper_pod>:/home/projects/upload --namespace=<namespace>
```

* If you wish to try the wrong example run 

```sh
kubectl apply -f actual-job.yaml --namespace=<namespace
```

[Go back to master](https://github.com/ammbra/troubleshooting/tree/master)

