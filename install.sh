# 1. Install the following GNOME extensions:
#    - Battery Percentage (https://extensions.gnome.org/extension/1191/battery-percentage/)
#    - Dash to Dock (https://extensions.gnome.org/extension/307/dash-to-dock/)
#    - Panel Date Format (https://extensions.gnome.org/extension/1462/panel-date-format/)
#    - Unite (https://extensions.gnome.org/extension/1287/unite/)
# Install VS Code ()
# 2. Setup SSH keys
# 3. Clone this repository
# 4. Install nerd-fonts:
#    a. Go to https://github.com/ryanoasis/nerd-fonts
#    b. Download .ttf's from https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode/Regular/complete
#    c. Download .ttf's from https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/DroidSansMono/complete
#    d. Copy to ~/.local/share/fonts


wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

apt update
apt upgrade

sudo apt install curl chrome-gnome-shell zsh ruby-full powerline fonts-powerline python-pip default-jdk gradle apt-transport-https dotnet-sdk-2.1

# Terminal configuration
chsh -s /usr/bin/zsh aogburn

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

ln -s ~/repos/dotfiles/.hyper.js ~/.hyper.js
ln -s ~/repos/dotfiles/.config/fontconfig/conf.d  ~/.config/fontconfig/conf.d

rm ~/.zshrc
ln -s ~/repos/dotfiles/.zshrc

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

# Customize datetime format in shell bar
dconf write /org/gnome/shell/extensions/panel-date-format/format "'%a  %b  %d   %l:%M %p'"

pip install awscli --upgrade --user

