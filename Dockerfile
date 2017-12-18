FROM garethjevans/jenkinsslave-alpine:v2.0-pre2

ENV BOSH_VERSION 2.0.45
ENV TERRAFORM_VERSION=0.11.0

USER root 

RUN apk update && apk --no-cache add zlib zlib-dev ruby ruby-dev ruby-rdoc ruby-irb ruby-io-console

RUN wget -nv https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-${BOSH_VERSION}-linux-amd64 -O /usr/local/bin/bosh && \
    chmod 755 /usr/local/bin/bosh

RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -O /tmp/terraform_${TERRAFORM_VERSION}.zip && \
    unzip /tmp/terraform_${TERRAFORM_VERSION}.zip -d /usr/local/bin && \
    rm -rf /tmp/terraform_${TERRAFORM_VERSION}.zip

USER jenkins
WORKDIR /home/jenkins
