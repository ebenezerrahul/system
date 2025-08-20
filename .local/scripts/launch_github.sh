#!/usr/bin/env bash

get_remote_url() {

    git remote get-url origin| grep https > /dev/null

    if [[ $? -eq 0 ]]
    then
        git remote get-url origin
        return
    fi

    local repo_path=$(git remote get-url origin| cut -d ':' -f 2);
    local domain="https://$(git remote get-url origin|cut -d ':' -f 1|cut -d '@' -f 2)"
    echo "$domain/$repo_path"
}

open_github() {
    get_remote_url
    if [[ -d .git ]]
    then
    fi
}

git ls-remote origin | grep $(git rev-parse HEAD)| grep merge| sed 's/.*\t//' | cut -d '/' -f 3
