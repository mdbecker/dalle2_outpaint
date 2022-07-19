FROM jupyter/base-notebook as notebook
LABEL name="notebook"
WORKDIR /home/jovyan
USER root
RUN apt-get update && apt-get install -yq --no-install-recommends build-essential \
    && apt-get install -yq openssh-client imagemagick ffmpeg gifsicle && apt-get clean && rm -rf /var/lib/apt/lists/*
USER jovyan
COPY notebook.yml .
RUN conda env update -n base -q -f notebook.yml
#RUN conda install -yq pip matplotlib seaborn statsmodels sqlalchemy pyyaml pymssql jupyter_contrib_nbextensions jupyterthemes lz4 gensim autopep8 yapf shap scikit-learn pandas numpy scipy nbconvert"<6"
RUN conda install -yq jupyter_contrib_nbextensions jupyterthemes
RUN jupyter contrib nbextension install --sys-prefix
RUN jupyter nbextension enable table_beautifier/main --sys-prefix
RUN jupyter nbextension enable execute_time/ExecuteTime --sys-prefix
RUN jupyter nbextension enable code_prettify/code_prettify --sys-prefix
RUN jupyter nbextension enable execution_dependencies/execution_dependencies --sys-prefix
RUN jupyter nbextension enable python-markdown/main --sys-prefix
RUN jupyter nbextension enable skip-traceback/main --sys-prefix
RUN jt -t monokai -f anonymous -fs 11 -nf ptsans -nfs 11 -cursw 2 -cursc r -cellw 99% -lineh 110 -T -N -ofs 11
RUN rm notebook.yml
RUN conda clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

# Configure container startup
ENTRYPOINT ["tini", "-g", "--"]
CMD ["start.sh", "jupyter", "notebook", "--no-browser", "--no-mathjax", "--NotebookApp.token=''"]