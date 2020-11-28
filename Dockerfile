# Dockerfile for sandbox in which python 3 code is run
FROM pypy:3

WORKDIR /usr/src/app

COPY pip-requirements.txt ./
RUN pip install --no-cache-dir -r pip-requirements.txt

CMD [ "pypy", "--sandbox", "--heapsize=${SANDBOX_PYPY_HEAPSIZE}", "--timeout=${SANDBOX_PYPY_TIMEOUT}", "/exec/main.py" ]