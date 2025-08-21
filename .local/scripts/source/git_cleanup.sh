gcu() {
    local branch_name=${1-main}
    git branch --merged $branch_name | grep -v "$branch_name" | xargs git branch -d
} ; export gcu
