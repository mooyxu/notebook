## Abstract
# This is a jupyter notebook development environment with anaconda3, python2.7, some other runtimes and packages.

FROM ubuntu:18.04
MAINTAINER Mooy Xu
ENV REFRESHED_AT 2020-01-21


# Config env
ENV LANG C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/anaconda/bin:$PATH

# Install basic system packages & tini
RUN echo "\e[1;42m[INFO] Installing system packages...\e[0m" &&\
    apt update --fix-missing &&\
    apt install wget bzip2 ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 git mercurial subversion -y &&\
    \
    echo "\e[1;42m[INFO] Installing tini...\e[0m" &&\
    apt install -y curl grep sed dpkg &&\
    TINI_VERSION=`curl https://github.com/krallin/tini/releases/latest | grep -o "/v.*\"" | sed 's:^..\(.*\).$:\1:'` &&\
    curl -L "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini_${TINI_VERSION}.deb" > tini.deb &&\
    dpkg -i tini.deb &&\
    \
    rm tini.deb &&\
    rm -rf /var/lib/apt/lists/*
ENTRYPOINT [ "/usr/bin/tini", "--" ]

# Install anaconda
RUN echo "\e[1;42m[INFO] Installing anaconda...\e[0m" &&\
    wget https://repo.anaconda.com/archive/Anaconda3-5.3.1-Linux-x86_64.sh -O ~/anaconda.sh &&\
    /bin/bash ~/anaconda.sh -b -p /opt/anaconda &&\
    echo ". /opt/anaconda/etc/profile.d/conda.sh" >> ~/.bashrc &&\
    echo "conda activate base" >> ~/.bashrc &&\
    \
    mkdir -p /opt/notebooks &&\
    mkdir -p /root/.jupyter &&\
    \
    rm ~/anaconda.sh
COPY jupyter_notebook_config.py /root/.jupyter/
EXPOSE 8888 8889

# Install conda runtimes
# 1. python2.7
# 2. octave  # Passed: conda install gnuplot
#    echo "\e[1;42m[INFO] Installing octave...\e[0m" &&\
#    apt install octave -y &&\
#    conda config --append channels conda-forge &&\
#    conda install octave_kernel -y --quiet &&\
#    conda install texinfo -y --quiet &&\
# 3. gcc
#    echo "\e[1;42m[INFO] Installing gcc...\e[0m" &&\
#    apt install gcc -y &&\
#    pip install jupyter-c-kernel &&\
#    install_c_kernel &&\
RUN echo "\e[1;42m[INFO] Installing conda runtimes...\e[0m" &&\
    apt update --fix-missing &&\
    \
    echo "\e[1;42m[INFO] Installing python2.7...\e[0m" &&\
    conda create --name python2 python=2.7 -y --quiet &&\
    conda install ipykernel -n python2 -y --quiet &&\
    /opt/anaconda/envs/python2/bin/ipython kernel install --name python2 &&\
    \
    conda clean --all &&\
    rm -rf ~/.cache/pip &&\
    rm -rf /var/lib/apt/lists/*

# Install python packages
# 1. tornado 5.1.1  # Compatible with notebook
# 2. tensorflow
# 3. pytorch
# 4. pyod
# 5. pyspark
RUN echo "\e[1;42m[INFO] Installing python packages...\e[0m" &&\
    \
    echo "\e[1;42m[INFO] Installing compatible packages...\e[0m" &&\
    conda install tornado=5.1.1 -y --quiet &&\
    \
    echo "\e[1;42m[INFO] Installing tensorflow...\e[0m" &&\
    conda remove wrapt --force -y &&\
    echo `pip search tensorflow` &&\
    pip install tensorflow==2.1.0 &&\
    \
    echo "\e[1;42m[INFO] Installing pytorch...\e[0m" &&\
    conda install pytorch-cpu torchvision-cpu -c pytorch -y --quiet &&\
    \
    echo "\e[1;42m[INFO] Installing pyod...\e[0m" &&\
    pip install pyod==0.7.5 &&\
    \
    echo "\e[1;42m[INFO] Installing pyspark...\e[0m" &&\
    pip install pyspark==2.4.4 &&\
    \
    conda clean --all &&\
    rm -rf ~/.cache/pip

# Default command
COPY run.sh /opt/
CMD ["/bin/bash", "/opt/run.sh"]
