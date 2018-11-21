FROM python:2.7
ADD . /rancher-gitlab-deploy
WORKDIR /rancher-gitlab-deploy
RUN python /rancher-gitlab-deploy/setup.py install
RUN ln -s /usr/local/bin/rancher-gitlab-deploy /usr/local/bin/upgrade

RUN apt-get update && \
    apt-get install -y --allow-unauthenticated tzdata && \
    apt-get install -y --allow-unauthenticated jq && \
    apt-get install -y --allow-unauthenticated curl && \
    apt-get install -y --allow-unauthenticated git-all

CMD rancher-gitlab-deploy