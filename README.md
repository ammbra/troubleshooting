# Intructions to Run this sample
**Disclaimer**: Docker Desktop was used for this sample. 
Push the image (docker push command) if you are using DockerHub or a private registry.
In case that you are using private registry, create a registry pull secret and update the **install.yaml**.

## Docker image
```sh
docker build . -t helloworld:1
#optionally, run locally the image
#docker run --rm -p8080:8080 -e ENV=docker --user $(id -u) helloworld:1
```

**Note**: if you want to play with the probes and replicate the behavior of a container that starts with a certain delay, go to _/health/install.yaml_ and  set **SIMULATE_LONGER_STARTUP** param to true:

                  env:
                    - name: SIMULATE_LONGER_STARTUP
                      value: "true"

## Deploying
* Go to /health folder and run 

```sh
kubectl apply -f install.yaml -n <namespace>
```
* **Tip**: enable terminationMessagePolicy and terminationMessagePath in order to capture the last chunk of 80 lines container log if (the termination message file is empty and) the container exited with an error.

```sh
   terminationMessagePolicy: FallbackToLogsOnError
   terminationMessagePath: "/tmp/custom-termination-log.log"
```

[Go back to master](https://github.com/ammbra/troubleshooting/tree/master)