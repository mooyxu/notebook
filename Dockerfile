## Abstract
# This is a jupyter notebook based on anaconda3 with python2.7 in it.

FROM continuumio/anaconda3
MAINTAINER Marvin Xu
ENV REFRESHED_AT 2019-06-05

# Install jupyter and python2.7 kernel
RUN /opt/conda/bin/conda install jupyter -y --quiet &&\
    mkdir -p /opt/notebooks &&\
    mkdir -p /root/.jupyter &&\
    \
    conda create --name python2 python=2.7 -y --quiet &&\
    conda install ipykernel -n python2 -y --quiet &&\
    /opt/conda/envs/python2/bin/ipython kernel install --name python2

# Config
ADD jupyter_notebook_config.py /root/.jupyter/
EXPOSE 8888

# Run
CMD ["/opt/conda/bin/jupyter", "notebook"]
