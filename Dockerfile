FROM jupyter/base-notebook:latest

LABEL author="ALTHOENM" 

USER root
WORKDIR /tmp

COPY ./data/requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt
COPY ./data/credentials.py /tmp/
COPY ./data/demo-notebook.ipynb /tmp/

RUN chown -R $NB_UID:$NB_UID /tmp
RUN chmod 755 /tmp

USER $NB_UID

CMD jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --allow-root