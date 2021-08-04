#!/bin/bash


git remote add github "https://$GITHUB_ACTOR:$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY.git"
git pull github ${GITHUB_REF} --ff-only

bundle install
cd $1
jekyll build
cd ..

tar cf ${GITHUB_REPOSITORY}-${GITHUB_SHA}.tar $1

echo "::set-output name=artifact_sha::$GITHUB_SHA"