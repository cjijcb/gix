#!/usr/bin/env bash

# Prompt String 1:
# ┌──(username@hostname)-[~/workdir](branch)
# └─$

# Color - raw ANSI
nc=$'\033[0m'
green=$'\033[1;32m'
yellow=$'\033[0;33m'
blue=$'\033[1;34m'

# Color - PS1 usage
ps() { printf '\[%s\]' "$1"; }

git_branch() {
  local branch
  branch=$(git branch --show-current 2>/dev/null) || return
  [[ -n "$branch" ]] || return
  printf '%s(%s%s%s)%s' \
    "$yellow" \
    "$nc" \
    "$branch" \
    "$yellow" \
    "$nc"
}

PS1=""
PS1+="$(ps "$green")┌──(\u"  # ┌──(username
PS1+="$(ps "$nc")@"          # @
PS1+="$(ps "$blue")\h)-["    # hostname)-[
PS1+="$(ps "$nc")\w"         # ~/workdir
PS1+="$(ps "$blue")]"        # ]
PS1+="$(ps "$nc")"
PS1+='$(git_branch)'         # (branch) or nothing
PS1+=$'\n'
PS1+="$(ps "$green")└─"      # └─
PS1+="$(ps "$nc")\$ "        # $
