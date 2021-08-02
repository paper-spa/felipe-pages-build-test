# Container image that runs your code
FROM ruby:3.0.2 AS pages

# Install dependencies
RUN apt-get update 
RUN apt-get install build-essential -y

# Install Ruby/Gems
ENV GEM_HOME="/usr/local/bundle"
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH
ENV GIT_MERGE_AUTOEDIT=no

COPY Gemfile /Gemfile

RUN gem install bundler &\
    bundle install

COPY entrypoint.sh /entrypoint.sh
ADD . /
# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]