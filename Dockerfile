# Container image that runs your code
FROM ruby:alpine3.14


ENV GEM_HOME="/usr/local/bundle"
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH

RUN gem install bundler &\
    gem install github-pages &\
    cat /usr/local/bundle/extensions/x86_64-linux-musl/3.0.0/ffi-1.15.3/mkmf.log

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]