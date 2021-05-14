# Dockerfile for sandbox in which python 3 code is run
FROM python:3-buster

# Get sandboxing
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get update && apt-get install -y cpulimit

# Get requirements to run scipy etc. on slim OSs
RUN apt-get update && apt-get install -y libopenblas-dev gfortran

# Install python libraries
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir numpy scipy
RUN pip install --no-cache-dir chess
RUN pip install --no-cache-dir --upgrade tensorflow
RUN pip install --no-cache-dir scikit-learn pillow
RUN pip install --no-cache-dir keras
RUN pip install --no-cache-dir Theano
RUN pip install --no-cache-dir Lasagne

# Set up user
RUN useradd --create-home --shell /bin/bash sandbox
WORKDIR /home/sandbox
USER sandbox

CMD [ "sleep",  "infinity" ]
