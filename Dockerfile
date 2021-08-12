# Container image that runs your code
FROM containers.pkg.github.com/github/pages/pages-actions AS pages
SHELL ["sh", "-c"]
ADD . /

# ENV GITHUB_REPOSITORY $GITHUB_REPOSITORY
# ENV GITHUB_SHA $GITHUB_SHA

# RUN ./install.sh 
# RUN export GITHUB_REPOSITORY=test/testy; export GITHUB_SHA=red; ./build.sh 
# RUN ./archive.sh

ENTRYPOINT ["sh", "-c", "printenv"]