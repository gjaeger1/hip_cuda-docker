FROM nvidia/cuda:11.0-runtime-ubuntu20.04

# Install software
ENV DEBIAN_FRONTEND=noninteractive 

RUN apt-get update
RUN apt-get install -y git nano cmake libthrust-dev
RUN wget -q -O - http://repo.radeon.com/rocm/rocm.gpg.key | apt-key add -
RUN printf "deb [arch=amd64] http://repo.radeon.com/rocm/apt/debian/ xenial main" | tee /etc/apt/sources.list.d/rocm.list
RUN apt-get update
RUN apt-get install hip-nvcc

WORKDIR /root
CMD ["bash"]
