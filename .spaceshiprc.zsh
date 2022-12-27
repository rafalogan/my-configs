# The way zsh completions are loaded, you will get the message even if there is no real security risk. So just enable
ZSH_DISABLE_COMPFIX="true"
## Comfiguration SPACESHIP PROMPT
# SPACESHIP_PROMPT_ORDER=(
#   user          # Username section
#   dir           # Current directory section
#   host          # Hostname section
#   git           # Git section (git_branch + git_status)
#   hg            # Mercurial section (hg_branch  + hg_status)
#   exec_time     # Execution time
#   line_sep      # Line break
#   vi_mode       # Vi-mode indicator
#   jobs          # Background jobs indicator
#   exit_code     # Exit code section
#   char          # Prompt character
# )
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
# SPACESHIP_CHAR_SYMBOL="\uf296"
SPACESHIP_CHAR_SUFFIX=" "
## Comfiguration SPACESHIP PROMPT
