# Setup SSH keys
# Clone this repository

apt update
apt upgrade

sudo apt install curl zsh ruby-full powerline python-pip
curl https://releases.hyper.is/download/deb

# Set zsh as default shell
chsh -s /usr/bin/zsh aogburn

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# gconftool --type string --set /desktop/gnome/applications/terminal/exec hyper

ln -s ~/repos/dotfiles/.hyper.js ~/.hyper.js
ln -s ~/repos/dotfiles/.config/Code/User/settings.json ~/.config/Code/User/settings.json

rm .zshrc
ln -s ~/repos/dotfiles/.zshrc ~/.zshrc
# mv .zshrc.pre-oh-my-zsh .zshrc

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

sudo gem install colorls

sudo -H pip install powerline-status