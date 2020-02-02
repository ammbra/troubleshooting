# Intructions to Run this sample
**Disclaimer**: Docker Desktop was used for this sample. 
Push the image (docker push command) if you are using DockerHub or a private registry.
In case that you are using private registry, create a registry pull secret and update the **install.yaml**.

## Docker image

```sh
docker build . -t helloworld:4
#optionally, run locally the image
#docker run --rm -p8080:8080 -e ENV=docker --user $(id -u) helloworld:4
```


## Deploying
* Go to /upgrade folder and run 

```sh
kubectl apply -f install.yaml -n <namespace>
```
* Set the image to version 4
```sh
  kubectl set image deployment/helloworld-upgrade helloworld=helloworld:4 --record --namespace=<namespace>
```

* Modify a bit the docker file and build it again with version 4. Perform a rollout restart.
```sh
 #starting with version 1.15
 kubectl rollout restart deploy helloworld-upgrade --namespace=<namespace>
```

* Patch a deployment.
```sh
kubectl patch deployment helloworld-upgrade -p \
  "{\"spec\":{\"template\":{\"metadata\":{\"labels\":{\"date\":\"`date +'%s'`\"}}}}}" --namespace=<namespace>
```
[Go back to master](https://github.com/ammbra/troubleshooting/tree/master)

