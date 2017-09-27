#!/bin/sh

set -e

# Docker Hub namespace
ns=okorz001

# Bake the current user into the base image for friendlier bind mounts.
(set -x; docker build -t "$ns/base:latest" \
    --build-arg USER_NAME=`whoami` \
    --build-arg USER_UID=`id -u` \
    --build-arg USER_GID=`id -g` \
    base)

# Images will be built in this order, without any intelligent dependency
# management. Make sure an image is built AFTER its base image!
images=(
    c
        # Languages that depend on gcc.
        cxx
        haskell
        rust
    java
        # JVM languages.
        clojure
        groovy
        scala
    node
    perl
    python
    ruby
)

for image in "${images[@]}"; do
    (set -x; docker build -t "$ns/$image:latest" "$image")
done

# Clean up older images.
yes | docker image prune
