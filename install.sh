# Setup SSH keys
# Clone this repository

apt update
apt upgrade

sudo apt install curl zsh ruby-full powerline fonts-powerline python-pip default-jdk gradle
curl https://releases.hyper.is/download/deb

# Set zsh as default shell
chsh -s /usr/bin/zsh aogburn

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# gconftool --type string --set /desktop/gnome/applications/terminal/exec hyper

ln -s ~/repos/dotfiles/.hyper.js ~/.hyper.js
ln -s ~/repos/dotfiles/.config/Code/User/settings.json ~/.config/Code/User/settings.json
ln -s ~/repos/dotfiles/.config/fontconfig/conf.d  ~/.config/fontconfig/conf.d

rm .zshrc
ln -s ~/repos/dotfiles/.zshrc ~/.zshrc
# mv .zshrc.pre-oh-my-zsh .zshrc

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

sudo gem install colorls

# Go to https://github.com/ryanoasis/nerd-fonts
# Download .ttf's from https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode/Regular/complete
# Download .ttf's from https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/DroidSansMono/complete
# Copy to ~/.local/share/fonts/

sudo -H pip install powerline-status

sudo fc-cache -fv

# Configure .npmrc file
#@zoll:registry=https://zoll-lifevest.myget.org/F/zoll-npm-packages/npm/
#//zoll-lifevest.myget.org/F/zoll-npm-packages/npm/:_authToken=GUID_HERE

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
