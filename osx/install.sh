
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update

brew install python
brew install shellcheck
brew install terraform

brew cask install brave-browser
brew cask install iterm2
brew cask install jetbrains-toolbox
brew cask install spotify
brew cask install visual-studio-code

pip3 install --upgrade --user awscli
pip3 install --upgrade --user runway

# Install dotnet
curl -L https://dot.net/v1/dotnet-install.sh -o dotnet-install.sh
chmod +x dotnet-install.sh
./dotnet-install.sh --channel 3.0
./dotnet-install.sh --channel 2.2
./dotnet-install.sh --channel 2.0
rm dotnet-install.sh

# Install RVM & more up-to-date ruby version 
gpg --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable --ruby

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash

# sudo apt install \
#   powerline \
#   fonts-powerline \
#   default-jdk \
#   gradle \
#   apt-transport-https \
#   dotnet-sdk-2.2 \
#   libpangox-1.0-0 \
#   libcanberra-gtk-module \
#   ca-certificates \
#   software-properties-common \
#   python3-tk \
#   python3-keyring

# Configure terminal
chsh -s /bin/zsh

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# ln -s ~/repos/dotfiles/.config/fontconfig/conf.d  ~/.config/fontconfig/conf.d

# Use .zshrc file from this repository
rm -f ~/.zshrc
ln -s ~/repos/dotfiles/osx/.zshrc ~/.zshrc

# git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# pip3 install --user --upgrade powerline-status

# VS Code configuration

code --install-extension ms-vscode.csharp
code --install-extension peterjausovec.vscode-docker
code --install-extension eamodio.gitlens
code --install-extension ms-vscode.go
code --install-extension davidanson.vscode-markdownlint
code --install-extension pkief.material-icon-theme
code --install-extension esbenp.prettier-vscode
code --install-extension alefragnani.project-manager
code --install-extension redhat.vscode-yaml
code --install-extension dbaeumer.vscode-eslint
code --install-extension mauve.terraform
code --install-extension ms-mssql.mssql
code --install-extension coenraads.bracket-pair-colorizer-2

rm ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/repos/dotfiles/vscode-settings.json ~/Library/Application\ Support/Code/User/settings.json

# # Install docker - https://docs.docker.com/install/linux/docker-ce/ubuntu/
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# sudo apt-key fingerprint 0EBFCD88
# sudo add-apt-repository \
#    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#    $(lsb_release -cs) \
#    stable"
# sudo apt-get update
# sudo apt-get install docker-ce

# # Docker post-install steps: https://docs.docker.com/install/linux/linux-postinstall/

# sudo groupadd docker
# sudo usermod -aG docker $USER

# sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
# sudo chmod g+rwx "$HOME/.docker" -R

# # Install docker-compose
# sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# sudo chmod +x /usr/local/bin/docker-compose
# sudo curl -L https://raw.githubusercontent.com/docker/compose/1.23.2/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose

# # Increase watchers available for IDEs
# sudo echo "fs.inotify.max_user_watches = 524288" > /etc/sysctl.d/ide.conf
# sudo sysctl -p --system 
