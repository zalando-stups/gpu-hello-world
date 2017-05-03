# STUPS GPU Hello World example

This application represents a basic GPU example to demonstrate the use of GPU instances using STUPS.

This is discussed in the STUPS User Guide [here](http://stups.readthedocs.io/en/latest/user-guide/gpu-hello-world.html).

## Building and pushing the Docker image

In order to build the Docker image, an `scm-source.json` file is required to build the Docker image for this project. The [STUPS documentation](http://stups.readthedocs.io/en/latest/user-guide/application-development.html#scm-source-json) provides a description of the file and alternative ways to generate it. One method is to use the `scm-source` [Python package](https://pypi.python.org/pypi/scm-source):
```bash
pip3 install --upgrade scm-source
scm-source
```

Now the Docker image for this example can be built by running the following command:
```bash
docker build -t pierone.example.com/teamname/gpu-hello-world:IMAGEVERSION .
```
where `IMAGEVERSION` represents the version tag to associate with the Docker images.

The built image can then be pushed to the PierOne registry:
```bash
docker push pierone.example.com/teamname/gpu-hello-world:IMAGEVERSION
```
(running the `pierone login` command may be required)


## Creating the Cloud Formation Stack using Senza
In order to deploy the stack with version `STACKVERSION`, run the following `senza` command:

```bash
senza create --region=eu-west-1 deploy-definition.yaml STACKVERSION pierone.example.com IMAGEVERSION example-mint-bucket-eu-west-1
```

This assumes:
* The Pierone registry is found at `pierone.example.com`
* A Docker image with version `IMAGEVERSION` exists at the registry for team to which the logged-in user belongs.
* The Mint bucket for credential storage is at `example-mint-bucket-eu-west-1`
