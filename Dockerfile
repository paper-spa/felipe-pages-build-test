FROM containers.pkg.github.com/github/pages/pages-actions AS pages
ADD . /

# ENV GITHUB_REPOSITORY $GITHUB_REPOSITORY
# ENV GITHUB_SHA $GITHUB_SHAå

ENTRYPOINT ["/bin/sh", "-c" ,"/install.sh && /build.sh && /archive.sh"]