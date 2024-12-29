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
        upstreamRef=($(git for-each-ref --format="%(refname:short)" refs/remotes/upstream/ma{in,ster}))
        case ${#upstreamRef[@]} in
            0)
                git pull ;;
            1)
                git fetch upstream && git rebase ${upstreamRef[0]} ;;
            *)
                echo "There are a main and a master branch in upstream?!; most likely something is broken"
        esac
	popd
    else
	echo "Repository $repository not cloned"
    fi
done
