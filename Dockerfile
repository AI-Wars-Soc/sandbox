# Dockerfile for sandbox in which python 3 code is run
FROM python:3.8-buster

RUN apt-get update \
&& apt-get install -y --no-install-recommends apt-utils \
&& apt-get install -y libopenblas-dev gfortran \
&& useradd --shell /bin/bash sandbox \
&& useradd --no-create-home --shell /bin/bash read_only_user \
&& pip install --no-cache-dir --upgrade pip wheel \
&& pip install --no-cache-dir --upgrade numpy scipy tensorflow scikit-learn pillow keras Theano Lasagne chess

# Set user
WORKDIR /home/sandbox
USER sandbox

CMD [ "sleep",  "infinity" ]
