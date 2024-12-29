#!/bin/bash

source ./sharedCode.sh

githubOrgUrl=https://github.com/Cuis-Smalltalk/

cd ..
for repository in ${repositories[@]}
do
    git clone $githubOrgUrl$repository
done
