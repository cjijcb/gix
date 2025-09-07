#!/bin/bash
NC="\[\033[0m\]"
H_GREEN="\[\033[1;32m\]"
L_YELLOW="\[\033[0;33m\]"
H_BLUE="\[\033[1;34m\]"

LP="$L_YELLOW($NC"   # Left parenthesis with yellow color
RP="$L_YELLOW)$NC"   # Right parenthesis with yellow color
GIT_BRANCH='$(
    branch=$(git branch --show-current 2>/dev/null)
    [[ -n "$branch" ]] && printf "'"$LP"'$branch'"$RP"'"
)'

PS1="$H_GREEN┌──(\u$NC@$H_BLUE\h)-[$NC\w$H_BLUE]$NC$GIT_BRANCH\n$H_GREEN└─$NC\$ "
