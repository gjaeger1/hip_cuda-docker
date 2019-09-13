FROM nvidia/cuda:10.1-devel-ubuntu18.04

# Install software
ENV DEBIAN_FRONTEND=noninteractive 

RUN apt-get update
RUN apt-get install -y git nano cmake
WORKDIR /
RUN git clone https://github.com/GPUOpen-ProfessionalCompute-Tools/HIP
WORKDIR /HIP
RUN ./bin/hipconfig
RUN mkdir -p /opt/rocm/hip
RUN cp -a ./bin /opt/rocm/hip
RUN cp -a ./include /opt/rocm/hip
RUN cp -a ./cmake /opt/rocm/hip

WORKDIR /root
CMD ["bash"]
