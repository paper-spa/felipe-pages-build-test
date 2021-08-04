#!/bin/bash


git remote add github "https://$GITHUB_ACTOR:$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY.git"
git pull github ${GITHUB_REF} --ff-only

bundle install
cd $1
jekyll build 

# tar -czvf ${GITHUB_REPOSITORY}-${GITHUB_SHA}.tar _site

tar -czvf testname.tar _site

echo "::set-output name=artifact_sha::$GITHUB_SHA"