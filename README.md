# Intructions to Run this sample
**Disclaimer**: Docker Desktop was used for this sample. 
Push the image (docker push command) if you are using DockerHub or a private registry.
In case that you are using private registry, create a registry pull secret and update the **install.yaml**.

## Docker image

Note: if you want to play with the probes and replicate the behavior of a container that starts with a certain delay, simply add in _Application.java_ the following:

        try {
            Thread.sleep(60*1000);
        } catch(InterruptedException e) {
            LOGGER.error("Exception while starting the app : {}", e);
        } 

```sh
docker build . -t helloworld:1
#optionally, run locally the image
#docker run --rm -p8080:8080 -e ENV=docker --user $(id -u) helloworld:1
```


## Deploying
* Go to /health folder and run 

```sh
kubectl apply -f install.yaml -n <namespace>
```
* Tip: enable terminationMessagePolicy and terminationMessagePath in order to capture the last chunk of 80 lines container log if (the termination message file is empty and) the container exited with an error.

```sh
   terminationMessagePolicy: FallbackToLogsOnError
   terminationMessagePath: "/tmp/custom-termination-log.log"
```

[Go back to master](https://github.com/ammbra/troubleshooting/tree/master)