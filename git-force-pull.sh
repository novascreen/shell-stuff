#!/bin/bash

branch=`git name-rev --name-only HEAD`

git checkout develop
git branch $branch -D
git checkout -t origin/$branch
