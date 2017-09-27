The repository contains some basic Dockerfiles for creating images for experimenting with different languages.

The build script will inject the current user into the base image as a convienience. This makes bind mounts
easier to work with since files created inside the container can be owned by the current user instead of root
or some other arbitrary user that does not exist outside of the container.
