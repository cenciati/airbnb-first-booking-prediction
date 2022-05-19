FROM jupyter/base-notebook

USER root

ENV JUPYTER_ENABLE_LAB=yes

ENV SPARK_HOME=/home/jovyan/spark/spark-3.2.1-bin-hadoop3.2
ENV PATH=${SPARK_HOME}/bin:${PATH}

RUN apt update && \ 
    apt upgrade -y && \
    apt install -y wget openjdk-11-jre

RUN cd ~ && \
    mkdir spark && \
    cd spark && \
    wget https://dlcdn.apache.org/spark/spark-3.2.1/spark-3.2.1-bin-hadoop3.2.tgz && \
    tar xzf spark-3.2.1-bin-hadoop3.2.tgz && \
    rm -rf spark-3.2.1-bin-hadoop3.2.tgz

USER $NB_UID

ENTRYPOINT [ "jupyter", "lab", "--no-browser" ]