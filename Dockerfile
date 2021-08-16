FROM containers.pkg.github.com/github/pages/pages-actions AS pages
ADD . /

# ENV GITHUB_REPOSITORY $GITHUB_REPOSITORY
# ENV GITHUB_SHA $GITHUB_SHAå
RUN ./install.sh
RUN ./build.sh

ENTRYPOINT ["/bin/sh", "-c" ,"/archive.sh"]