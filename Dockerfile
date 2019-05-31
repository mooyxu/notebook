## Abstract
# This is a jupyter notebook with anaconda3

FROM continuumio/anaconda3
MAINTAINER Marvin Xu
ENV REFRESHED_AT 2019-05-31

# Install
RUN /opt/conda/bin/conda install jupyter -y --quiet &&\
    mkdir -p /opt/notebooks &&\
    mkdir -p /root/.jupyter

# Config
ADD jupyter_notebook_config.py /root/.jupyter/
EXPOSE 8888

# Run
CMD ["/opt/conda/bin/jupyter", "notebook"]
