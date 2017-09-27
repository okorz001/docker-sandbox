FROM okorz001/base:latest

RUN apt-get update \
 && apt-get install -y -qq --no-install-recommends \
        openjdk-8-jdk-headless \
        # TODO: Could install these from tarballs
        maven \
        gradle \
 && rm -rf /var/lib/apt/lists/*

# Some things do not work without this.
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
