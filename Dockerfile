# Container image that runs your code
FROM ruby:3.0.2 AS pages

# Install dependencies
RUN sudo apt-get install build-essential

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