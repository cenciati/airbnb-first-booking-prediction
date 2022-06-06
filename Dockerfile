FROM jupyter/base-notebook

USER root

ENV JUPYTER_ENABLE_LAB=yes

ENV SPARK_HOME=/opt/spark-3.2.1-bin-hadoop3.2
ENV PATH=${PATH}:${SPARK_HOME}/bin

WORKDIR ~/work

COPY . .

EXPOSE 8888
EXPOSE 4040

RUN apt update && \ 
    apt upgrade -y && \
    apt install -y wget openjdk-11-jre

RUN cd /opt && \
    wget https://dlcdn.apache.org/spark/spark-3.2.1/spark-3.2.1-bin-hadoop3.2.tgz && \
    tar xf spark-3.2.1-bin-hadoop3.2.tgz && \
    rm -rf spark-3.2.1-bin-hadoop3.2.tgz

USER $NB_UID

ENTRYPOINT [ "jupyter", "lab", "--no-browser" ]
