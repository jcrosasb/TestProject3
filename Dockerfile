FROM continuumio/miniconda3:4.10.3p1

WORKDIR /project

ADD environment_3.yml .

RUN conda env create -n testproject3_env_doc --file environment_3.yml

RUN conda install \
    numpy \
    pandas \
    matplotlib \
    jupyterlab

COPY ./README.md /project
COPY ./data /project/data
COPY ./docs /project/docs
COPY ./env /project/env
COPY ./environment_3.yml /project/environment_3.yml
COPY ./notebooks /project/notebooks
COPY ./src /project/src
COPY ./tests /project/tests

CMD ["jupyter-lab","--ip=0.0.0.0","--no-browser","--allow-root"]