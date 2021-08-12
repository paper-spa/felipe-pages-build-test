# Container image that runs your code
FROM containers.pkg.github.com/github/pages/pages-actions AS pages
SHELL ["/bin/bash", "-c"]
ADD . /

ENV GITHUB_REPOSITORY $GITHUB_REPOSITORY
ENV GITHUB_SHA $GITHUB_SHA

RUN GITHUB_REPOSITORY $GITHUB_REPOSITORY ./install.sh &\
    GITHUB_REPOSITORY $GITHUB_REPOSITORY ./build.sh &\
    ./archive.sh

