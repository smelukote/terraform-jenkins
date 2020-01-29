# Using Ubuntu LTS
FROM ubuntu:16.04
# Set maintainer
LABEL maintainer "adiagil@corelogic.com"
RUN apt-get update && apt-get install -y wget curl unzip
# Add the Cloud SDK distribution URI as a package source
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
# Import the Google Cloud Platform public key
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
# Install GCloud
RUN apt-get update && apt-get install -y google-cloud-sdk
# Download Terraform 0.11.13
RUN wget -q -c https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip -P /tmp/
# Install Terraform 0.11.13
RUN unzip /tmp/terraform_0.11.13_linux_amd64.zip -d /usr/local/bin/
# Clearing
RUN rm /tmp/terraform_0.11.13_linux_amd64.zip
