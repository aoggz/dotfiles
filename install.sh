apt-get update
apt-get upgrade

apt-get install curl zsh ruby-full powerline python-pip
curl https://releases.hyper.is/download/deb

# Set zsh as default shell
chsh -s /bin/zsh $USER

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

gconftool --type string --set /desktop/gnome/applications/terminal/exec hyper

rm .zshrc
mv .zshrc.pre-oh-my-zsh .zshrc

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

gem install colorls

sudo -H pip install powerline-status
