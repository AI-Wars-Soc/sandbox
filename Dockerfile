# Dockerfile for sandbox in which python 3 code is run
FROM python:3-buster

# Get sandboxing
RUN apt update && apt install cpulimit -y

# Get requirements to run scipy etc. on slim OSs
RUN apt update && apt install libopenblas-dev gfortran -y

# Install python libraries
COPY pip-requirements.txt ./
RUN pip3 install --no-cache-dir -r pip-requirements.txt

# Set up user
RUN useradd --create-home --shell /bin/bash sandbox --uid 1429
WORKDIR /home/sandbox
USER sandbox

CMD [ "sleep",  "infinity" ]