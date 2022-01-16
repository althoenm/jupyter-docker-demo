FROM jupyter/minimal-notebook

LABEL author="ALTHOENM" 

USER root
WORKDIR /tmp

COPY ./data/requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt
COPY ./data/demo-notebook.ipynb /tmp/
COPY ./data/credentials.py /tmp/

USER $NB_UID

CMD jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --allow-root