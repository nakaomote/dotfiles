# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

_uname_s="$(uname -s)"

# Aliases.
case ${_uname_s} in
    Linux)
        alias ls='ls -FA --color=auto'
        alias grep='grep --colour=auto'
        alias ll='ls -lA --color=auto'
    ;;
    OpenBSD)
        alias ls="ls -FA"
        alias ll='ls -lA'
    ;;
esac
alias uptime='clear;logout' # XXX Trainer wheels.
alias ifconfig='clear;logout' # XXX Trainer wheels.

# Editor.
export EDITOR="vim"

# Man pager.
export MANPAGER="vimmanpager"

# Completions.
complete -cf sudo

# History.
HISTSIZE=1000000
HISTFILESIZE=1000000
HISTCONTROL=ignoreboth
shopt -s histappend

# Git branch in prompt.
function _git_check_branch {
    local ref
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return 1
    echo -e "($_PromptGitBranch${ref#refs/heads/}$_PromptEchoBracket)-"
}

function _git_check_rebase {
    local git_dir
    git_dir=$(git rev-parse --git-dir 2>/dev/null) || return 1
    if [ -d "$git_dir/rebase-merge" -o -d "$git_dir/rebase-apply" ]; then
        echo -e "(${_PromptGitRebase}rebasing${_PromptEchoBracket})-"
    else
        return 1
    fi
}

function _git_check_stash {
    local ref
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return 1
    if git stash list | \
    awk 'BEGIN { _exit=1 }; $4 == "'${ref#refs/heads/}':" { _exit=0 } END { exit(_exit); } '; then
        echo -e "(${_PromptGitRebase}stash${_PromptEchoBracket})-"
    else
        return 1
    fi
}

function _check_jobs {
    if [[ $(jobs | wc -l) -gt 0 ]]; then
        local jobs=$(jobs | wc -l)
        echo -e "(${_PromptJobs}$jobs${_PromptEchoBracket})-"
    else
        return 0
    fi
}

function _show_error {
    if [[ $_last_error != 0 ]]; then
        echo -e "(${_PromptErrors}$_last_error${_PromptEchoBracket})-"
    fi
    unset _last_error
}

function _show_logons {
    local logons
    logons="$(w | awk ' FNR > 2 && $1 != ENVIRON["USER"] { print $1 }' | sort | uniq -c | awk ' { print $1":"$2 } ' | xargs)"
    if [ -z "$logons" ]; then
        return
    fi
    echo -e "($_PromptLogons$logons$_PromptEchoBracket)-"
}

# ssh-agent.
if ! ssh-add -l > /dev/null 2>&1; then
    if [ -f ~/.ssh-agent ]; then
        if ! pgrep -U $USER -x ssh-agent > /dev/null; then
            ssh-agent | grep -v ^echo > ~/.ssh-agent
            . ~/.ssh-agent
            ssh-add
        else
            . ~/.ssh-agent
            if ! ssh-add -l > /dev/null 2>&1; then
                ssh-add
            fi
        fi
    fi
fi

# Functions.
if [ -d ~/.bash/functions ]; then
    for funct in ~/.bash/functions/*; do
        if [ -f $funct ]; then
            source $funct
        fi
    done
    unset funct
fi
