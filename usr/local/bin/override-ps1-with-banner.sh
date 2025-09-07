#!/bin/bash
# Colors for PS1 (wrapped with \[ \])
NC="\[\033[0m\]"
H_RED="\[\033[1;31m\]"
H_GREEN="\[\033[1;32m\]"
L_YELLOW="\[\033[0;33m\]"
H_BLUE="\[\033[1;34m\]"

# Colors for printf (raw, no \[ \])
NC_P="\033[0m"
H_RED_P="\033[1;31m"
H_GREEN_P="\033[1;32m"

# Parentheses in yellow
LP="${L_YELLOW}(${NC}"
RP="${L_YELLOW})${NC}"

# Git branch display
GIT_BRANCH='$(
    branch=$(git branch --show-current 2>/dev/null)
    [[ -n "$branch" ]] && printf "'"$LP"'$branch'"$RP"'"
)'

# Show environment and role only once
if [ -z "$_ENV_ROLE_SHOWN" ]; then
    printf '%b\n' "${H_GREEN_P}[] NODE 0${NC_P}"
    export _ENV_ROLE_SHOWN=1
fi

# Custom PS1
set_custom_prompt() {
    PS1="${H_GREEN}┌──(\u${NC}@${H_BLUE}\h)-[${NC}\w${H_BLUE}]${NC}${GIT_BRANCH}\n${H_GREEN}└─${NC}\$ "
}

# Preserve existing PROMPT_COMMAND without duplication
if [ -n "$PROMPT_COMMAND" ]; then
    PROMPT_COMMAND="$PROMPT_COMMAND; set_custom_prompt"
else
    PROMPT_COMMAND="set_custom_prompt"
fi
export PROMPT_COMMAND

