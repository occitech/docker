FROM jenkins/jenkins:lts

USER root

RUN apt-get update \
    && apt-get install -y \
          sudo \
          software-properties-common \
          apt-transport-https \
          apt-transport-https \
    && curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable"

RUN apt-get update \
    && apt-get install -y \
          make \
          rsync \
          ruby \
          docker-ce \
          dnsutils \
    && rm -rf /var/lib/apt/lists/* \
    && echo 'jenkins ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

RUN usermod -a -G docker jenkins

RUN curl -L https://github.com/docker/compose/releases/download/1.29.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

USER jenkins
