#!/bin/bash


git remote add github "https://$GITHUB_ACTOR:$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY.git"
git pull github ${GITHUB_REF} --ff-only

bundle install
cd $1
jekyll build 

ls

REPO_NAME=$(basename $GITHUB_REPOSITORY)
tar -czf ${REPO_NAME}_${GITHUB_SHA}.tar _site

echo "Red"

echo "does this line up $GITHUB_ACTION"

echo "::set-output name=artifact_name::${REPO_NAME}_${GITHUB_SHA}.tar"

ls -a