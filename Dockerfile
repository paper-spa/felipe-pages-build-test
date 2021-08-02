# Container image that runs your code
FROM ruby:alpine3.14 AS pages

# Install dependencies
RUN apk add --update make
RUN apk add --update gcc
RUN apk add --update musl-dev

ENV CPLUS_INCLUDE_PATH=/usr/local/include/c++/8.2.0:/usr/local/include:/usr/include:$CPLUS_INCLUDE_PATH


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