# Intructions to Run this sample
**Disclaimer**: Docker Desktop was used for this sample. 
Push the image (docker push command) if you are using DockerHub or a private registry.
In case that you are using private registry, create a registry pull secret and update the **install.yaml**.

## Docker image

```sh
docker build . -t helloworld:2
#optionally, run locally the image
#docker run --rm -p8080:8080 -e ENV=docker --user $(id -u) helloworld:2
```


## Deploying
* Go to /permissions folder and run 

```sh
kubectl apply -f install.yaml -n <namespace>
```
* Run the commands from roles.sh in order to play with roles.

[Go back to master](https://github.com/ammbra/troubleshooting/tree/master)

