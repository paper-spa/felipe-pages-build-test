# Container image that runs your code
FROM containers.pkg.github.com/github/pages/pages-actions AS pages
ADD . /

# ENV GITHUB_REPOSITORY $GITHUB_REPOSITORY
# ENV GITHUB_SHA $GITHUB_SHA

RUN sh -c ./install.sh 
RUN sh -c ./build.sh 

ENTRYPOINT ["sh", "-c", "./archive.sh"]