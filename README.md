# Intructions to Run this sample
**Disclaimer**: Docker Desktop was used for this sample. 

## Deploying
* If you wish to replicate the faulty behavior of the job please go to /jobs folder and run 

```sh
kubectl apply -f great-job.yaml -n <namespace>
```
* Tip 1 to stop the job : suspend it.

```sh
   kubectl patch cronjob <name> -p '{"spec": { "suspend": true }}' -n <namespace>

```

* Tip 2 to stop the job : patch the schedule option.

```sh
    kubectl patch cronjob <name> -p '{"spec": { "schedule": "* * 30 2 *" }}' -n <namespace>
```

* Tip 3 to stop the job : patch with backofflimit set to 0 (see _great-hob-alt.yaml_)

```sh
    kubectl patch cronjob <name> -p '{"spec":{"jobTemplate":{"spec":{"backoffLimit":"0"}}}}' -n <namespace>
```

The job with corrected command is in _correct-great-job.yaml_.

The goal is to stop the job and keep the pods for further inspection.
[Go back to master](https://github.com/ammbra/troubleshooting/tree/master)