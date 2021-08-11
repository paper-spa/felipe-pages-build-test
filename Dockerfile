# Container image that runs your code
FROM containers.pkg.github.com/github/pages/pages-actions AS pages

RUN printenv

RUN ./install.sh
RUN ./build.sh
RUN ./archive.sh