# Container image that runs your code
FROM containers.pkg.github.com/github/pages/pages-actions AS pages

RUN echo "test"
# RUN ./install.sh
RUN ./build.sh
# RUN ./archive.sh