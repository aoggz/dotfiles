

path=$PATH
path="$path:/usr/local/go/bin"
path="$path:/usr/local/opt/ruby/bin"
path="$path:/usr/local/opt/llvm/bin"
path="$path:$HOME/.dotnet"
path="$path:$HOME/.local/bin"
path="$path:$HOME/go/bin"
path="$path:$HOME/Library/Python/3.7/bin"
path="$path:$HOME/.rvm/bin"

export ZSH=~/.oh-my-zsh
export GOPATH=~/go
export DEPLOY_ENVIRONMENT=aogburn
export PATH=$path

# nvm config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# https://github.com/denysdovhan/spaceship-prompt
ZSH_THEME="spaceship"

# Plugins
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

alias bfg="java -jar /usr/local/bin/bfg-1.13.0.jar"
alias d="docker"
alias g="git"
alias h="history"
alias la="ls -a"
alias ls=colorls
alias tf=terraform
alias b64=base64
alias docker-rma='docker rm $(docker ps -a -q)'
alias docker-rmai='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
alias ruby='/usr/local/Cellar/ruby/2.7.0/bin'

# POWERLEVEL9K_MODE='nerdfont-complete'
# #POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(icons_test)
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv nvm vcs)

# POWERLEVEL9K_VCS_GIT_ICON=$' '
# POWERLEVEL9K_VCS_GIT_GITHUB_ICON='\uf113 '
# POWERLEVEL9K_VCS_GIT_GITLAB_ICON='\uf296 '
# POWERLEVEL9K_VCS_STAGED_ICON=$'\uf055 '
# POWERLEVEL9K_VCS_UNSTAGED_ICON=$'\uf421 '
# POWERLEVEL9K_VCS_UNTRACKED_ICON=$'\uf00d '
# POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=$'\uf0ab '
# POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=$'\uf0aa '

# aws() {
#   docker run --rm -it \
#     --name aws \
#     --log-driver none \
#     -v "${HOME}/.aws:/root/.aws" \
#     jess/awscli "$@"
# }

# export AWS_ACCESS_KEY_ID=`aws configure get default.aws_access_key_id`
# export AWS_SECRET_ACCESS_KEY=`aws configure get default.aws_secret_access_key` 
export AWS_DEFAULT_REGION=`aws configure get default.region` 
export AWS_REGION=$AWS_DEFAULT_REGION

packer() {
  docker run --rm -it \
    --name packer \
    --log-driver none \
    -e DEPLOY_ENVIRONMENT \
    -v "${HOME}/.aws:/root/.aws" \
    -v "${PWD}:/app" \
    -w /app \
    hashicorp/packer "$@"
}

gitversion() {
  docker run --rm -it \
    --name gitversion \
    --log-driver none \
    -v "${PWD}:/repo" \
    gittools/gitversion:5.0.0-linux-netcoreapp2.1 /repo "$@"
}

# runway() {
#   docker run --rm -it \
#     --log-driver none \
#     -v "${HOME}/.aws:/root/.aws" \
#     -v "/var/run/docker.sock:/var/run/docker.sock" \
#     -v "${PWD}:/app" \
#     -w /app \
#     -e AWS_ACCESS_KEY_ID \
#     -e AWS_SECRET_ACCESS_KEY \
#     -e AWS_SESSION_TOKEN \
#     -e DEPLOY_ENVIRONMENT \
#     registry.gitlab.zoll-lifevest.com/docker/runway-plus runway "$@"
# }

# terraform() {
#   docker run --rm -it \
#     --name terraform \
#     --log-driver none \
#     -e AWS_ACCESS_KEY_ID \
#     -e AWS_SECRET_ACCESS_KEY \
#     -e AWS_SESSION_TOKEN \
#     -v "${HOME}/.aws:/root/.aws" \
#     -v "${PWD}:/app" \
#     -w /app \
#     hashicorp/terraform "$@"
# }

gitlab-terraform() {
  docker run --rm -it \
    --log-driver none \
    -e AWS_ACCESS_KEY_ID \
    -e AWS_SECRET_ACCESS_KEY \
    -e AWS_SESSION_TOKEN \
    -e TF_ADDRESS \
    -e TF_USERNAME \
    -e TF_PASSWORD \
    -v "${HOME}/.aws:/root/.aws" \
    -v "${PWD}:/app" \
    -w /app \
    registry.gitlab.com/gitlab-org/terraform-images/stable:latest gitlab-terraform "$@"
}

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
