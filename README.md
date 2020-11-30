# submission-runner
A single sandbox instance for user's submissions


# Documentation

## Environment variables
 -  `SANDBOX_PYTHON_TIMEOUT` gives the total time that python is allowed to execute for. Eg. '10s'

## Running sandbox
The sandbox will attempt to run '`/exec/main.py`'. Any OS calls are put into stdout, 
and should either be replied to on stdin or the container should be halted if the request is not allowed.

In normal execution, all of these calls should probably be reported back to the user in the form of an error code

Pip modules to install can be given in sandbox/pip-requirements.txt