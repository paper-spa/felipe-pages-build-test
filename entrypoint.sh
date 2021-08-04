#!/bin/bash


git remote add github "https://$GITHUB_ACTOR:$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY.git"
git pull github ${GITHUB_REF} --ff-only

bundle install
cd $1
jekyll build 

REPO_NAME=$(basename $GITHUB_REPOSITORY)
tar -czvf ${REPO_NAME}_${GITHUB_SHA}.tar _site

echo "::set-output name=artifact_name::${REPO_NAME}_${GITHUB_SHA}.tar"

ls -a