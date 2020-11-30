# Dockerfile for sandbox in which python 3 code is run
FROM python:3

# Get requirements to run scipy etc. on slim OSs
RUN apt-get update && apt-get install libopenblas-dev gfortran -y

# Install python libraries
COPY pip-requirements.txt ./
RUN pip3 install --no-cache-dir -r pip-requirements.txt

# Set up user
RUN useradd --create-home --shell /bin/bash sandbox
WORKDIR /home/sandbox

# Add run script
COPY run.sh ./
RUN chown sandbox run.sh \
	&& chmod ugo+x run.sh \
	&& chmod ugo-w run.sh \

# Set user before executing
USER sandbox

# Run with timeout
CMD [ "sh", "-c", "timeout $SANDBOX_PYTHON_TIMEOUT ./run.sh" ]