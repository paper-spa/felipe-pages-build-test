#!/bin/bash


git remote add github "https://$GITHUB_ACTOR:$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY.git"
git pull github ${GITHUB_REF} --ff-only
git config --global user.email "felipesu19@github.com"
git config --global user.name "Your Name"

git fetch --all


git checkout -b gh-pages origin/gh-pages
git pull origin gh-pages
git merge main 

cd hacker-master
bundle install

jekyll build
cd .. 
ls -l
cp -r _site/* ../docs/

git add -A

git commit -m "Automatic update"
git push origin gh-pages --force