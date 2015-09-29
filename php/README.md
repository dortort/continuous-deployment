# Continuous Deployment using Git & Docker

## PHP Projects

This image is available for pulling from [Docker Hub](https://index.docker.io/u/dortort/continuous-deployment).

Launch this container with the following environment variables to suit your situation:

* GIT_REPO
* GIT_BRANCH (Defaults to "master")
* DOC_ROOT (Optional. Relative to repository root. Must begin with "/")

### Running this container

Running this container is as simple as running the following command:

    docker run -d \
        -e GIT_REPO="https://github.com/my/repo.git" \
        -e GIT_BRANCH="release-1.0.0" \
        -e DOC_ROOT="/web" \
        dortort/continuous-deployment:php

### Using SSH keys

The following example uses a Bitbucket.org deployment key.

```dockerfile
FROM dortort/continuous-deployment:php

RUN apt-get update \
        && apt-get install -y openssh-client --no-install-recommends \
        && rm -rf /var/lib/apt/lists/*

RUN mkdir /root/.ssh && ssh-keyscan -t rsa bitbucket.org >> /root/.ssh/known_hosts

COPY ssh_config /root/.ssh/config
COPY ssh_key /root/.ssh/key

RUN chmod 0600 /root/.ssh/key

ENV GIT_REPO="ssh://git@bitbucket.org/my/repo.git"
ENV GIT_BRANCH="master"
ENV DOC_ROOT="/web"
```