export ZSH="/home/aogburn/.oh-my-zsh"

ZSH_THEME="powerlevel9k/powerlevel9k"

# Plugins
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

alias la="ls -a"
alias ls="colorls"
alias tf=terraform
alias b64="base64_encode"

function base64_encode() {
  node -e "console.log(Buffer.from('$1').toString('base64'))"
}

POWERLEVEL9K_MODE='nerdfont-complete'
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(icons_test)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)

POWERLEVEL9K_VCS_GIT_ICON=$' '
POWERLEVEL9K_VCS_GIT_GITHUB_ICON='\uf113 '
POWERLEVEL9K_VCS_GIT_GITLAB_ICON='\uf296 '
POWERLEVEL9K_VCS_STAGED_ICON=$'\uf055 '
POWERLEVEL9K_VCS_UNSTAGED_ICON=$'\uf421 '
POWERLEVEL9K_VCS_UNTRACKED_ICON=$'\uf00d '
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=$'\uf0ab '
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=$'\uf0aa '
