#!/bin/bash


if [ ! -n "$1" ]; then
    /opt/anaconda/bin/jupyter notebook 2>&1 >/opt/notebook.log &
    /opt/anaconda/bin/jupyter lab
else
    /opt/anaconda/bin/jupyter notebook --NotebookApp.password=$1 2>&1 >/opt/notebook.log &
    /opt/anaconda/bin/jupyter lab --NotebookApp.password=$1
fi