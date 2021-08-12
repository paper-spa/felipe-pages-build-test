# Container image that runs your code
FROM containers.pkg.github.com/github/pages/pages-actions AS pages
SHELL ["sh", "-c"]
ADD . /

RUN ./install.sh 
RUN ./build.sh 
RUN ./archive.sh

ENTRYPOINT ["echo $GITHUB_SHA"]