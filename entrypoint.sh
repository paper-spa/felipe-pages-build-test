#!/bin/bash


git remote add github "https://$GITHUB_ACTOR:$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY.git"
git pull github ${GITHUB_REF} --ff-only

cd $GITHUB_REPOSITORY

jekyll build

git add ...

git commit -m "Automatic update"
git push github HEAD:${GITHUB_REF}