FROM garethjevans/jenkinsslave-alpine:v2.0-pre2

ENV BOSH_VERSION 2.0.28
ENV BOSH_GEN_VERSION 0.24.0
ENV BBL_VERSION 3.2.3
ENV TERRAFORM_VERSION=0.9.6

USER root 

RUN apk update && apk --no-cache add zlib zlib-dev ruby ruby-dev ruby-rdoc ruby-irb ruby-io-console

RUN wget -nv https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-${BOSH_VERSION}-linux-amd64 -O /usr/local/bin/bosh2 && \
    chmod 755 /usr/local/bin/bosh2 && \
    gem install bosh-gen -v ${BOSH_GEN_VERSION}

RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -O /tmp/terraform_${TERRAFORM_VERSION}.zip && \
    unzip /tmp/terraform_${TERRAFORM_VERSION}.zip -d /usr/local/bin && \
    rm -rf /tmp/terraform_${TERRAFORM_VERSION}.zip

RUN wget https://github.com/cloudfoundry/bosh-bootloader/releases/download/v${BBL_VERSION}/bbl-v${BBL_VERSION}_linux_x86-64 -O /usr/local/bin/bbl && \
    chmod 755 /usr/local/bin/bbl

USER jenkins
WORKDIR /home/jenkins
