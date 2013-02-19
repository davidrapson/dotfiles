# Requires git_cdw_info (see bin/git_cdw_info)
# https://github.com/benhoskings/dot-files/blob/master/files/bin/git_cwd_info

prompt_char() {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    # echo '○' # No repo
}

function ruby_version()
{
    if which rvm-prompt &> /dev/null; then
      rvm-prompt i v g
    else
      if which rbenv &> /dev/null; then
        rbenv version | sed -e "s/ (set.*$//"
      fi
    fi
}

# For my own and others sanity
# git:
# %b => current branch
# %a => current action (rebase/merge)
# prompt:
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host
# %(?..) => prompt conditional - %(condition.true.false)

PROMPT='
%{$fg_bold[cyan]%}%~%{$reset_color%} $(prompt_char)$(git_cwd_info)
%F{cyan}❯%f '

# RPROMPT='$(prompt_char) $(git_cwd_info)%{$reset_color%}'
# RPROMPT='%F{magenta}$(rbenv_prompt_info)%f'
RPROMPT='%F{magenta}$(ruby_version)%f'
