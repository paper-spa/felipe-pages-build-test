# Container image that runs your code
FROM containers.pkg.github.com/github/pages/pages-actions AS pages
ADD . /

# ENV GITHUB_REPOSITORY $GITHUB_REPOSITORY
# ENV GITHUB_SHA $GITHUB_SHA

ENTRYPOINT ["sh", "-c", "./install.sh &&  ./build.sh && ./archive.sh"]