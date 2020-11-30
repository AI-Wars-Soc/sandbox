# Dockerfile for sandbox in which python 3 code is run
FROM python:3

# Get requirements to run scipy etc. on slim OSs
RUN apt-get update && apt-get install libopenblas-dev gfortran -y

WORKDIR /usr/src/app

COPY pip-requirements.txt ./
RUN pip3 install --no-cache-dir -r pip-requirements.txt

CMD [ "sh", "-c", "python3 /exec/main.py" ]