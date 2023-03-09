right_triangle() {
    echo $'\u276f'
}

prompt_indicator() {
   echo $'%B\u276f%b'
}

arrow_start() {
   echo "%{$FG[$ARROW_FG]%}%{$BG[$ARROW_BG]%}%B"
}

arrow_end() {
   echo "%b%{$reset_color%}%{$FG[$NEXT_ARROW_FG]%}%{$BG[$NEXT_ARROW_BG]%}$(right_triangle)%{$reset_color%}"
}

remote_prefix() {
   ARROW_FG="009"
   ARROW_BG=""
   NEXT_ARROW_FG="009"
   NEXT_ARROW_BG=""
   echo "$(arrow_start) REMOTE $(arrow_end)"
}

ok_username() {
   ARROW_FG="051"
   ARROW_BG=""
   NEXT_ARROW_FG="051"
   NEXT_ARROW_BG=""
   echo "$(arrow_start) %n $(arrow_end)"
}

err_username() {
   ARROW_FG="160"
   ARROW_BG=""
   NEXT_ARROW_FG="160"
   NEXT_ARROW_BG=""
   echo "$(arrow_start) %n $(arrow_end)"
}

# return err_username if there are errors, ok_username otherwise
username() {
   echo "%(?.$(ok_username).$(err_username))"
}

directory() {
   ARROW_FG="121"
   ARROW_BG=""
   NEXT_ARROW_FG="121"
   NEXT_ARROW_BG=""
   echo "$(arrow_start) %~ $(arrow_end)"
}

current_time() {
   echo "%{$fg[green]%}%*%{$reset_color%}"
}

git_prompt() {
   ARROW_FG="152"
   ARROW_BG=""
   NEXT_ARROW_FG="159"
   NEXT_ARROW_BG=""
   echo "$(arrow_start) $(git_prompt_info) $(arrow_end)"
}

# set the git_prompt_info text
# ZSH_THEME_GIT_PROMPT_PREFIX=""
# ZSH_THEME_GIT_PROMPT_SUFFIX=""
# ZSH_THEME_GIT_PROMPT_DIRTY="*"
# ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[016]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[202]%}*%{$fg[016]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# set the git_prompt_status text
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} ✈%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✭%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➦%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ✂%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[white]%} ✱%{$reset_color%}"



PROMPT='$(remote_prefix)$(username)$(directory)$(git_prompt)
$(prompt_indicator) '
RPROMPT='$(git_prompt_status) $(current_time)'