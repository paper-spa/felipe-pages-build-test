#!/bin/sh
REPO_NAME=$(basename $GITHUB_REPOSITORY)
echo $(ls)
tar -czfv ${REPO_NAME}_${GITHUB_SHA}.tar ./_site

echo "::set-output name=artifact_name::${REPO_NAME}_${GITHUB_SHA}.tar"
