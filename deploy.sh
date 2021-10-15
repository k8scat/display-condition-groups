#!/bin/bash
set -e

npm run build

pushd dist

git init
git add -A
git commit -m 'deploy'

git push -f git@github.com:k8scat/display-condition-groups.git main:gh-pages

popd
