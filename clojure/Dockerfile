FROM okorz001/java:latest

RUN apt-get update \
 && apt-get install -y -qq --no-install-recommends \
        clojure \
 && rm -rf /var/lib/apt/lists/*

# Lein isn't packaged in Debian currently.
# Lein doesn't provide a distribution tarball either.
ARG LEIN_VERSION=2.7.1
ARG LEIN_HOME=/opt/leiningen-$LEIN_VERSION
ARG LEIN_CMD=$LEIN_HOME/bin/lein
ARG LEIN_JAR=$LEIN_HOME/share/leiningen-$LEIN_VERSION-standalone.jar

RUN mkdir -p `dirname $LEIN_CMD` \
 && wget -q --no-hsts -O $LEIN_CMD https://raw.githubusercontent.com/technomancy/leiningen/$LEIN_VERSION/bin/lein-pkg \
 && chmod a+x $LEIN_CMD \
 && sed -i -e "s|^LEIN_JAR=.*$|LEIN_JAR=$LEIN_JAR|" $LEIN_CMD \
 && mkdir -p `dirname $LEIN_JAR` \
 && wget -q --no-hsts -O $LEIN_JAR https://github.com/technomancy/leiningen/releases/download/$LEIN_VERSION/leiningen-$LEIN_VERSION-standalone.zip

ENV PATH=$PATH:$LEIN_HOME/bin  
