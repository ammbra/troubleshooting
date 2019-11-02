# Intructions to Run this sample
**Disclaimer**: Docker Desktop was used for this sample. 
Push the image (docker push command) if you are using DockerHub or a private registry.
In case that you are using private registry, create a registry pull secret and update the **install.yaml**.

## Docker image

```sh
docker build . -t helloworld:3
#optionally, run locally the image
#docker run --rm -p8080:8080 -e ENV=docker --user $(id -u) helloworld:3
```


## Deploying
* Go to /exec folder and run 

```sh
kubectl apply -f install.yaml -n <namespace>
```
* Try the following in order to play with exec command

```sh
  kubectl exec -it <pod>  -- /bin/bash
  ###or run directly the command with exec
  kubectl exec <pod> ps aux
  kubectl exec <pod> ls 
```

[Go back to master](https://github.com/ammbra/troubleshooting/tree/master)

