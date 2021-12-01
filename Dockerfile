FROM mcr.microsoft.com/dotnet/sdk:5.0-focal AS build

WORKDIR /workspace

#Install the necessary Azure CLI dependencies.
RUN apt-get update
RUN apt-get install --yes ca-certificates curl apt-transport-https lsb-release gnupg

#Install the Microsoft signing keys.
RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null

#Add the Azure CLI software repository
RUN AZ_REPO=$(lsb_release -cs)
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | tee /etc/apt/sources.list.d/azure-cli.list

#Install the actual CLI
RUN apt-get update
RUN apt-get install --yes azure-cli