
export ZSH="/home/aogburn/.oh-my-zsh"
export PATH=~/.local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export DEPLOY_ENVIRONMENT=aogburn

# nvm config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

ZSH_THEME="powerlevel9k/powerlevel9k"

# Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

alias d="docker"
alias g="git"
alias h="history"
alias la="ls -a"
alias ls=colorls
alias tf=terraform
alias b64=base64
alias docker-rma='docker rm $(docker ps -a -q)'
alias docker-rmai='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'

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

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/aogburn/repos/hot-metal/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/aogburn/repos/hot-metal/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/aogburn/repos/hot-metal/node_modules/tabtab/.completions/sls.zsh ]] && . /home/aogburn/repos/hot-metal/node_modules/tabtab/.completions/sls.zsh

aws() {
  docker run --rm -it \
    --name aws \
    --log-driver none \
    -v "${HOME}/.aws:/root/.aws" \
    jess/awscli "$@"
}

export AWS_ACCESS_KEY_ID=`aws configure get default.aws_access_key_id`
export AWS_SECRET_ACCESS_KEY=`aws configure get default.aws_secret_access_key` 

runway() {
  docker run --rm -it \
    --name runway \
    --log-driver none \
    -e DEPLOY_ENVIRONMENT \
    -v "${HOME}/.aws:/root/.aws" \
    -v "${PWD}:/app" \
    -w /app \
    anozaki/runway runway "$@"
}
