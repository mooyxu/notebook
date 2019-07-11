## Abstract
# This is a jupyter notebook based on anaconda3 with python2.7 and some other runtimes in it.

FROM continuumio/anaconda3
MAINTAINER Marvin Xu
ENV REFRESHED_AT 2019-07-10


# Add sources
# 1. apt (China) && update
# 2. conda (China)
# Install
# 3. jupyter
# 4. kernel: python2
# 5. kernel: octave # Passed: conda install gnuplot
# 6. kernel: c
RUN sed -i '1i\deb http://mirrors.163.com/debian/ stretch main non-free contrib\ndeb http://mirrors.163.com/debian/ stretch-updates main non-free contrib\ndeb http://mirrors.163.com/debian/ stretch-backports main non-free contrib\ndeb-src http://mirrors.163.com/debian/ stretch main non-free contrib\ndeb-src http://mirrors.163.com/debian/ stretch-updates main non-free contrib\ndeb-src http://mirrors.163.com/debian/ stretch-backports main non-free contrib\ndeb http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib\ndeb-src http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib' /etc/apt/sources.list  &&\
    apt update &&\
    \
    conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/  &&\
    \
    /opt/conda/bin/conda install jupyter -y --quiet &&\
    mkdir -p /opt/notebooks &&\
    mkdir -p /root/.jupyter &&\
    \
    conda create --name python2 python=2.7 -y --quiet &&\
    conda install ipykernel -n python2 -y --quiet &&\
    /opt/conda/envs/python2/bin/ipython kernel install --name python2 &&\
    \
    apt install octave -y &&\
    conda config --add channels conda-forge &&\
    conda install octave_kernel -y --quiet &&\
    conda install texinfo -y --quiet &&\
    \
    apt install gcc -y &&\
    pip install jupyter-c-kernel &&\
    install_c_kernel


# Config
ADD jupyter_notebook_config.py /root/.jupyter/
EXPOSE 8888

# Run
CMD ["/opt/conda/bin/jupyter", "notebook"]
