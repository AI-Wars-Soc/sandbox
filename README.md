# AiWarSoc Submission Runner Sandbox

A single sandbox instance for running user's submissions. Has a collection of fail-safes like timeouts etc., however restrictions on hardware must be placed once the image is running

## Usage

The default user for this image is `sandbox`, which has write access to its home. This user should be used to copy the user’s submission and any auxiliary code onto the image once it has been launched.

There is a second user with read-only permissions called `read_only_user`. Once the scripts have been copied, they should be run using this user to lock down the possible effects of the scripts.

## Contributing

To add new libraries that the user’s AIs may want to use, modify the `Dockerfile` do add the relevant `pip install` commands.

Any pull requests with additional security measures are welcomed.