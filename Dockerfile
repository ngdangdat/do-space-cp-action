FROM python:3.7-alpine

LABEL "com.github.actions.name"="DigitalOcean Space Copy"
LABEL "com.github.actions.description"="Copy a directory to DigitalOcean Space recursively"
LABEL "com.github.actions.icon"="refresh-cw"
LABEL "com.github.actions.color"="green"

LABEL version="0.1.0"
LABEL repository="https://github.com/ngdangdat/do-space-sync-cp"
LABEL maintainer="ngdangdat <ngdangdat09@gmail.com>"

# https://github.com/aws/aws-cli/blob/master/CHANGELOG.rst
ENV AWSCLI_VERSION='1.16.232'

RUN pip install --quiet --no-cache-dir awscli==${AWSCLI_VERSION}

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
