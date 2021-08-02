# Container image that runs your code
FROM ruby:alpine3.14


ENV GEM_HOME="/usr/local/bundle"
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH

RUN sudo apt-get install libz-dev libiconv-hook1 libiconv-hook-dev &\
    gem install bundler &\
    gem install github-pages 
# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]