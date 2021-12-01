FROM mcr.microsoft.com/dotnet/sdk:6.0-focal AS build

WORKDIR /workspace

#Install the necessary Azure CLI dependencies.
RUN apt-get update
RUN apt-get install --yes ca-certificates curl apt-transport-https lsb-release gnupg  postgresql-client

#Install the Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

#Install the Docker CLI
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update
RUN apt-get install --yes docker-ce docker-ce-cli containerd.io