ARG REGISTRY=quay.io
ARG OWNER=jupyter
ARG BASE_CONTAINER=$REGISTRY/$OWNER/datascience-notebook
FROM $BASE_CONTAINER

USER root

RUN apt-get -y update

RUN wget https://raw.githubusercontent.com/kzailac/GFO_Seizmologija_I/refs/heads/main/seis.yml
RUN conda install --file seis.yml
RUN apt install htop -y
RUN apt install python3-mpi4py -y

USER jovyan
RUN cd /home/jovyan
RUN python -m pip install mpi4py