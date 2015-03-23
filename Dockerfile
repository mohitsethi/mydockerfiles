FROM ubuntu:14.04

RUN (sudo apt-get update -y)

RUN (ln -s -f /bin/true /usr/bin/chfn) && \
    (apt-get update) && \
    (apt-get install -y --no-install-recommends openjdk-7-jdk build-essential git openssh-client curl wget rsync) && \
    (apt-get clean) && \
    (rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*)

# install nodejs
RUN (apt-get update) && \
    (apt-get install -y software-properties-common python-software-properties python) && \
    (apt-get install -y nodejs npm) && \
    (npm install dredd) && \
    (npm install aglio)

# VOLUME /var/lib/jenkins
VOLUME /var/lib/ms
# EXPOSE 8080
# EXPOSE 8443

# CMD ["/usr/bin/jenkins"]
