wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo add-apt-repository ppa:system76/pop

sudo apt update
sudo apt upgrade

sudo apt install \
  curl \
  zsh \
  ruby-full \
  powerline \
  fonts-powerline \
  python2.7 \
  python-pip \
  default-jdk \
  gradle \
  apt-transport-https \
  dotnet-sdk-2.1 \
  redshift \
  redshift-gtk \
  xfce4-notifyd \
  pop-icon-theme \
  libpangox-1.0-0 \
  libcanberra-gtk-module \
  ca-certificates \
  gnupg2 \
  software-properties-common
  
# Enable GNOME-like notifications
# https://askubuntu.com/questions/101606/clickable-gnome-style-notifications-in-unity
sudo apt purge notify-osd\

killall -v notify-osd

# Terminal configuration
chsh -s /usr/bin/zsh aogburn

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

ln -s ~/repos/dotfiles/.hyper.js ~/.hyper.js
ln -s ~/repos/dotfiles/.config/fontconfig/conf.d  ~/.config/fontconfig/conf.d

rm -f ~/.zshrc
ln -s ~/repos/dotfiles/.zshrc

ln -s ~/repos/dotfiles/.config/redshift.conf  ~/.config/redshift.conf

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

sudo gem install colorls

sudo -H pip install powerline-status

sudo fc-cache -fv

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

rm ~/.config/Code/User/settings.json
ln -s ~/repos/dotfiles/.config/Code/User/settings.json ~/.config/Code/User/settings.json

pip install awscli --upgrade --user

# Install docker - https://docs.docker.com/install/linux/docker-ce/ubuntu/
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce

# Docker post-install steps: https://docs.docker.com/install/linux/linux-postinstall/

sudo groupadd docker
sudo usermod -aG docker $USER

sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R

# Install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

# Increase watchers available for IDEs
sudo echo "fs.inotify.max_user_watches = 524288" > /etc/sysctl.d/ide.conf
sudo sysctl -p --system 

# Install Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client

mkdir ~/.spotify
curl https://community.spotify.com/spotify/attachments/spotify/desktop_linux/296/1/spotify_control.zip --output ~/.spotify/spotify_control.zip
unzip ~/.spotify/spotify_control.zip -d ~/.spotify/
chmod a+x ~/.spotify/spotify_control
rm ~/.spotify/spotify_control.zip

# Install snaps
snap install slack --classic
snap install hiri
snap install pulseaudio

# Move launcher to the bottom of the screen
gsettings set com.canonical.Unity.Launcher launcher-position Bottom

sudo apt install pavucontrol
