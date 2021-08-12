# Container image that runs your code
FROM containers.pkg.github.com/github/pages/pages-actions AS pages
SHELL ["/bin/bash", "-c"]
ADD . /

RUN ls

ENV GITHUB_REPOSITORY $GITHUB_REPOSITORY
ENV GITHUB_SHA $GITHUB_SHA

RUN ./install.sh &\
    ./build.sh &\
    ./archive.sh

