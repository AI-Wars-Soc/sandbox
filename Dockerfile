# Dockerfile for sandbox in which python 3 code is run
FROM python:3-buster

# Get sandboxing
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get update && apt-get install -y cpulimit

# Get requirements to run scipy etc. on slim OSs
RUN apt-get update && apt-get install -y libopenblas-dev gfortran

# Install python libraries
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir --upgrade numpy scipy tensorflow scikit-learn pillow keras Theano Lasagne

# Set up user
RUN useradd --shell /bin/bash sandbox

# Remove write permissions from home/sandbox
RUN mkdir /home/sandbox \
&& chown -R root:root /home/sandbox \
&& chmod u=rwx /home/sandbox \
&& chmod go=rx /home/sandbox

# Set user
WORKDIR /home/sandbox
USER sandbox

CMD [ "sleep",  "infinity" ]
