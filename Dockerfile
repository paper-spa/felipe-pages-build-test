FROM containers.pkg.github.com/github/pages/pages-actions AS pages
WORKDIR "/"
ADD . /

# ENV GITHUB_REPOSITORY $GITHUB_REPOSITORY
# ENV GITHUB_SHA $GITHUB_SHAå

ENTRYPOINT ["/bin/sh", "-c" ,"/install.sh && jekyll build  && /report_state.sh && /archive.sh"]