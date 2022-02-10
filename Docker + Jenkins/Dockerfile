FROM jenkins
USER root

RUN mkdir -p /tmp/download && \
    curl -L https://get.docker.com/build/Linux/x86_64/docker-1.13.1.tgz | tar -xz -C /tmp/download && \
    rm -rf /tmp/download/docker/dockerd && \
    mv /tmp/download/docker/docker* /usr/local/bin && \
    rm -rf /tmp/download && \
    groupadd -g 999 docker && \
    usermod -aG docker jenkins

USER jenkins