# Container image that runs your code
FROM ruby:alpine3.14 AS pages

# Install dependencies
RUN apk add --update make

# Install Ruby/Gems
ENV GEM_HOME="/usr/local/bundle"
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH
COPY Gemfile /Gemfile

RUN gem install bundler &\
    bundle install

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]