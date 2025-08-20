#!/usr/bin/env bash

get_remote_url() {

    git remote get-url origin| grep https > /dev/null

    if [[ $? -eq 0 ]]
    then
        git remote get-url origin
        return
    fi

    local repo_path=$(git remote get-url origin| cut -d ':' -f 2|sed 's/\.git//');
    local domain="https://$(git remote get-url origin|cut -d ':' -f 1|cut -d '@' -f 2)"
    echo "$domain/$repo_path"
}

open_github() {
    if [[ -d .git ]]
    then
        local remote_url=$(get_remote_url)
        if [[ -z $remote_url ]]
        then
            return
        fi
        local mr=$(git ls-remote origin | grep $(git rev-parse HEAD) | grep -E 'pull|merge' | sed 's/.*\t//'| cut -d '/' -f 2,3|sed 's/\-/\_/');
        if [[ -z $mr ]]
        then
            platform_open $remote_url
            return
        else
            platform_open "$remote_url/$mr"
        fi
    fi

}

platform_open() {

        if [[ $(uname) == "Linux" ]]
        then
            xdg-open $1
        else
            open $1
        fi
}

open_github
