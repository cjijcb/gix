#!/usr/bin/env bash

# Prompt String 1:
# ┌──(username@hostname)-[~/workdir](branch)
# └─$

# Color - raw ANSI
nc=$'\033[0m'
red=$'\033[38;5;124m'
grey=$'\033[38;5;242m'

# Color - PS1 usage
ps() { printf '\[%s\]' "$1"; }

git_branch() {
  local branch
  branch=$(git branch --show-current 2>/dev/null) || return
  [[ -n "$branch" ]] || return
  printf '%s(%s%s%s)%s' \
    "$red" \
    "$nc" \
    "$branch" \
    "$red" \
    "$nc"
}

PS1=""
PS1+="$(ps "$red")┌──("   # ┌──(
PS1+="$(ps "$red")\u"     # username
PS1+="$(ps "$grey")@"     # @
PS1+="$(ps "$red")\h"     # hostname
PS1+="$(ps "$red"))-["    # )-[
PS1+="$(ps "$nc")\w"      # ~/workdir
PS1+="$(ps "$red")]"      # ]
PS1+="$(ps "$nc")"
PS1+='$(git_branch)'      # (branch) or nothing
PS1+=$'\n'
PS1+="$(ps "$red")└─$"    # └─$
PS1+="$(ps "$nc") "
