#!/bin/bash

source ./sharedCode.sh

repositories=(${PWD##*/} ${repositories[@]})
cd ..
for repository in ${repositories[@]}
do
    if test -r $repository
    then
	echo -e "Updating \e[7m -----$repository----- \e[0m..."
	pushd $repository
        upstreamRef=$(git ls-remote --symref upstream HEAD 2>/dev/null | awk '/^ref:/ {sub("refs/heads/", "", $2); print "upstream/" $2}')
        if [[ -n "$upstreamRef" ]]; then
            git fetch upstream && git rebase "$upstreamRef"
        else
            git pull
        fi
	popd
    else
	echo "Repository $repository not cloned"
    fi
done
