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
