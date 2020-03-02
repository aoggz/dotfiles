# dotfiles/linux

## Installation

1. Run `sudo apt install ubuntu-unity-desktop`.
1. Install [VS Code](https://code.visualstudio.com/docs/?dv=linux64_deb)
1. Download the below fonts (click the Download button on the pages):
   - [Fira Code Regular Nerd Font Complete.ttf](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf)
   - [Fira Code Regular Nerd Font Complete Mono.ttf](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete%20Mono.ttf)
   - [Droid Sans Mono Nerd Font Complete.otf](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf)
   - [Droid Sans Mono Nerd Font Complete Mono.otf](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete%20Mono.otf)
1. Copy to `~/.local/share/fonts`
1. Setup SSH keys
1. Setup default AWS profile
1. Clone this repository
1. Run `./install.sh`.
1. [Optional] Run `nvm install --lts` to install the latest LTS version of node.
1. [Optional] Run `nvm install-latest-npm` to update npm to the latest for the current node.js version.
1. System Settings --> Appearance --> Behavior --> Auto hide launcher. Increase show sensitivity.
1. Add any private nuget feeds to the `~\.nuget\NuGet\NuGet.Config` file.
1. Add any private npm feeds to the `~\.npmrc` file.
