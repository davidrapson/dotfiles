# Uses git_cdw_info
# https://github.com/benhoskings/dot-files/blob/master/files/bin/git_cwd_info
# and prompt_char
# Add this to your functions file
# function prompt_char {
#     git branch >/dev/null 2>/dev/null && echo '±' && return
#     hg root >/dev/null 2>/dev/null && echo '☿' && return
#     echo '○'
# }

PROMPT='
%{$fg_bold[cyan]%}%~%{$reset_color%}
➤ '

RPROMPT='$(prompt_char) $(git_cwd_info)%{$reset_color%}'
