FROM nvidia/cuda:8.0-runtime

COPY scm-source.json /

CMD nvidia-smi
