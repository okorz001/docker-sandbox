FROM okorz001/base:latest

RUN apt-get update \
 && apt-get install -y -qq --no-install-recommends \
        gcc \
        libc-dev \
 && rm -rf /var/lib/apt/lists/*
