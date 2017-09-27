FROM debian:unstable

# Add app user so we can drop privileges.
ARG USER_NAME=app
ARG USER_UID=1000
ARG USER_GID=1000

RUN groupadd --gid $USER_GID $USER_NAME \
 && useradd --create-home --uid $USER_UID --gid $USER_GID $USER_NAME

RUN apt-get update \
 && apt-get install -y -qq --no-install-recommends \
        less \
        # For installing things that aren't packaged by Debian.
        wget \
 && rm -rf /var/lib/apt/lists/*
