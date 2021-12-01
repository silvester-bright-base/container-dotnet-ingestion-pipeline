FROM mcr.microsoft.com/dotnet/sdk:5.0-focal AS build

WORKDIR /workspace

#Install the necessary Azure CLI dependencies.
RUN apt-get update
RUN apt-get install --yes ca-certificates curl apt-transport-https lsb-release gnupg  postgresql-client

#Install the Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

