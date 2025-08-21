gcu() {
    local branch_name=${1-main}
    echo $branch_name
    git branch --merged $branch_name | grep -v "$branch_name" | xargs git branch -d
} ; export gcu
