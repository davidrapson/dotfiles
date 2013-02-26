# Requires git_cdw_info (see bin/git_cdw_info)
# https://github.com/benhoskings/dot-files/blob/master/files/bin/git_cwd_info

# Use VCS_Info
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*:*' get-revision true
zstyle ':vcs_info:git*:*' check-for-changes true
precmd() { vcs_info }

# hash changes branch misc
# zstyle ':vcs_info:git*' formats "(%s) %12.12i %c%u %b%m"
zstyle ':vcs_info:git*' formats "%{$fg_bold[cyan]%}%b%{$reset_color%}@%{$fg_bold[magenta]%}%8.8i%{$reset_color%} %u%c%{$fg_bold[red]%}%m%{$reset_color%}"
# zstyle ':vcs_info:git*' actionformats "(%s|%a) %12.12i %c%u %b%m"

# activate hooks
zstyle ':vcs_info:git*+set-message:*' hooks git-st git-stash

function prompt_char() {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    # echo '○' # No repo
}

function ruby_version() {
    if which rvm-prompt &> /dev/null; then
      rvm-prompt i v g
    else
      if which rbenv &> /dev/null; then
        rbenv version | sed -e "s/ (set.*$//"
      fi
    fi
}

# Show remote ref name and number of commits ahead-of or behind
function +vi-git-st() {
    local ahead behind remote
    local -a gitstatus

    # Are we on a remote-tracking branch?
    remote=${$(git rev-parse --verify ${hook_com[branch]}@{upstream} \
        --symbolic-full-name 2>/dev/null)/refs\/remotes\/}

    if [[ -n ${remote} ]] ; then
        # for git prior to 1.7
        # ahead=$(git rev-list origin/${hook_com[branch]}..HEAD | wc -l)
        ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
        (( $ahead )) && gitstatus+=( "${c3}+${ahead}${c2}" )

        # for git prior to 1.7
        # behind=$(git rev-list HEAD..origin/${hook_com[branch]} | wc -l)
        behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
        (( $behind )) && gitstatus+=( "${c4}-${behind}${c2}" )

        #hook_com[branch]="${hook_com[branch]} [${remote} ${(j:/:)gitstatus}]"
        hook_com[branch]="${hook_com[branch]}[${remote}]"
    fi
}

# Show count of stashed changes
function +vi-git-stash() {
    local -a stashes

    if [[ -s ${hook_com[base]}/.git/refs/stash ]] ; then
        stashes=$(git stash list 2>/dev/null | wc -l | sed 's/^ *//g')
        hook_com[misc]+=" (${stashes} stashed)"
    fi
}

PROMPT='
%{$fg_bold[cyan]%}%~%{$reset_color%} $(prompt_char) ${vcs_info_msg_0_}
%F{cyan}❯%f '

#PROMPT='
#%{$fg_bold[cyan]%}%~%{$reset_color%} $(prompt_char)$(git_cwd_info)$(parse_git_stash) ${vcs_info_msg_0_}
#%F{cyan}❯%f '

# RPROMPT='%F{magenta}$(rbenv_prompt_info)%f'
# RPROMPT='%{$fg[magenta]%}$(ruby_version)%{$reset_color%}'
