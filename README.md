# STUPS GPU Hello World example

This application represents a basic GPU example to demonstrate the use of GPU instances using STUPS.

This is discussed in the STUPS User Guide [here](http://stups.readthedocs.io/en/latest/user-guide/gpu-hello-world.html).

## Notes on a GPU-enabled Senza definition

The file `deply-definition.yaml` contains the following options that may require some explanation:
- The instance type is specified as `p2.xlarge` to allow for GPU computing. All `p2.*` and `g2.*` instances are supported, but `p2.*` instances are recommended from a performance point of view.
- A Spot Price for the instances has been specified.
- The Security Group and IAM Role definitions have been specified in the YAML file. This will create them at each deployment and does not require that they be manually created using e.g. `stups init`.

## Deployment
### Building and pushing the Docker image

In order to build the Docker image, an `scm-source.json` file is required to build the Docker image for this project. The [STUPS documentation](http://stups.readthedocs.io/en/latest/user-guide/application-development.html#scm-source-json) provides a description of the file and alternative ways to generate it. One method is to use the `scm-source` [Python package](https://pypi.python.org/pypi/scm-source):
```bash
pip3 install --upgrade scm-source
scm-source
```

Now the Docker image for this example can be built by running the following command:
```bash
docker build -t pierone.stups.example.org/teamname/gpu-hello-world:IMAGEVERSION .
```
where `IMAGEVERSION` represents the version tag to associate with the Docker images.

The built image can then be pushed to the PierOne registry:
```bash
docker push pierone.stups.example.org/<your-team>teamname/gpu-hello-world:IMAGEVERSION
```
(running the `pierone login` command may be required)


### Creating the Cloud Formation Stack using Senza
In order to deploy the stack with version `STACKVERSION`, run the following `senza` command:

```bash
senza create --region=eu-west-1 deploy-definition.yaml STACKVERSION pierone.stups.example.org IMAGEVERSION example-mint-bucket-eu-west-1
```

This assumes:
* The Pierone registry is found at `pierone.stups.example.org`
* A Docker image with version `IMAGEVERSION` exists at the registry for team to which the logged-in user belongs.
* The Mint bucket for credential storage is at `example-mint-bucket-eu-west-1`

### Checking the output
The output of the `nvidia-smi` command is written to `/var/log/application.log` and this can be checked by logging into the instance using `piu`. Alternatively, a log provider such as [Scalyr](https://www.scalyr.com) can be used.