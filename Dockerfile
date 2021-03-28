# Dockerfile for sandbox in which python 3 code is run
FROM python:3-buster

# Get sandboxing
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get update && apt-get install -y cpulimit

# Get requirements to run scipy etc. on slim OSs
RUN apt-get update && apt-get install -y libopenblas-dev gfortran

# Install python libraries
COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt

# Set up user
RUN useradd --create-home --shell /bin/bash sandbox --uid 1429
WORKDIR /home/sandbox
USER sandbox

CMD [ "sleep",  "infinity" ]