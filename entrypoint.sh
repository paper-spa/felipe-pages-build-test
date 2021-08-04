#!/bin/bash


git remote add github "https://$GITHUB_ACTOR:$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY.git"
git pull github ${GITHUB_REF} --ff-only

bundle install
cd $1
jekyll build 

echo ${GITHUB_REPOSITORY}_${GITHUB_SHA}
tar -czvf ${GITHUB_REPOSITORY}_${GITHUB_SHA}.tar _site

ls -la 

echo "::set-output name=artifact_sha::$GITHUB_SHA"