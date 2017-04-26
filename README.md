# STUPS GPU Hello World example

This application represents a basic GPU example to demonstrate the use of GPU instances using STUPS.

This is discussed in the STUPS User Guide [here](http://stups.readthedocs.io/en/latest/user-guide/gpu-hello-world.html).

## Deployment

### Creating the Cloud Formation Stack using Senza
In order to deploy the stack with version `STACKVERSION`, run the following `senza` command:

```bash
senza create --region=eu-west-1 deploy-definition.yaml STACKVERSION pierone.example.com IMAGEVERSION example-mint-bucket-eu-west-1
```

This assumes:
* The Pierone registry is found at `pierone.example.com`
* A Docker image with version `IMAGEVERSION` exists at the registry for team to which the logged-in user belongs.
* The Mint bucket for credential storage is at `example-mint-bucket-eu-west-1`
