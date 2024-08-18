# Zsh Customization
## Install Zsh
1. Install the shell by running the next command:
```bash 
sudo pacman -S zsh
```
2. Set the shell as default:
```bash
chsh -s /bin/zsh
```
3. Restart the system
4. Create the `.zshrc` file:
```bash
touch ~/.zshrc
```

## Install plugin manager
As plugin manager we are going to use [zinit](https://github.com/zdharma-continuum/zinit). To use this tool we follow the next steps:
1. Add to the `.zshrc` file the next line:
```bash
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
```
2. install the plugins:
```
