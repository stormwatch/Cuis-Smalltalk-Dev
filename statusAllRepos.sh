#!/bin/bash

source ./sharedCode.sh

echo
echo -e "Status of \e[7m =====Cuis-Smalltalk-Dev===== \e[0m"
git status
echo
pushd ..
for repository in ${repositories[@]}
do
    if test -r $repository
    then
	echo -e "Status of \e[7m -----$repository----- \e[0m..."
	pushd $repository
	git status -s
	popd
    else
	echo "Repository $repository not cloned"
    fi
done
popd
