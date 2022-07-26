FROM gitpod/workspace-full

# "GitPod: Custom Docker Image" https://www.gitpod.io/docs/config-docker
# "GitPod: Python init prebuild not working #7078" - https://github.com/gitpod-io/gitpod/issues/7078
# "dotnet: Install Ubuntu" - https://docs.microsoft.com/en-us/dotnet/core/install/linux-ubuntu#2004
# "dotnet: Ensure global tools dir is on the PATH #520" - https://github.com/dotnet/dotnet-docker/issues/520

RUN \
    wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb &&\
    sudo dpkg -i packages-microsoft-prod.deb &&\
    rm packages-microsoft-prod.deb &&\
    true
RUN \
    sudo apt-get update &&\
    sudo apt-get install -y apt-transport-https &&\
    sudo apt-get update &&\
    sudo apt-get install -y dotnet-sdk-6.0 &&\
    true

ENV PATH=$PATH:/home/gitpod/.dotnet/tools
RUN \
    dotnet tool install --global Microsoft.dotnet-interactive &&\
    dotnet interactive jupyter install &&\
    true
