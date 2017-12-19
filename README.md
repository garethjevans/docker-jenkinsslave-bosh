# docker-jenkinsslave-bosh

Jenkins Slave docker image, based off [garethjevans/jenkinsslave-alpine](https://hub.docker.com/r/garethjevans/jenkinsslave-alpine/), with [BOSH](https://bosh.io/) and [Terraform](https://www.terraform.io/)

This is available on Docker hub as [garethjevans/jenkinsslave-bosh](https://hub.docker.com/r/garethjevans/jenkinsslave-bosh/)

## Usage

To create a basic Jenkins BOSH Slave instance use:

```
docker run \
    --detach \
    --env JENKINS_MASTER=<JENKINS_MASTER_ADDRESS> \
    --env JENKINS_USERNAME=<JENKINS_USERNAME> \
    --env JENKINS_PASSWORD=<JENKINS_PASSWORD> \
    --env JENKINS_EXECUTORS=1 \
    --env JENKINS_LABELS=bosh \
    --env JENKINS_NAME=bosh-slave \
    --env LANG=C.UTF-8 \
    --name jenkins_bosh \
    --volume /etc/localtime:/etc/localtime:ro \
    garethjevans/jenkinsslave-bosh:latest
```

Obviously, you'll need an instance of Jenkins Master as well, try [garethjevans/jenkins](https://hub.docker.com/r/garethjevans/jenkins/).
