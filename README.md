# Dotfiles
Version control for my dotfiles.

You can use this repo in one of two ways:

1. Check out my dotfiles for inspiration.
2. Clone this repo into your home directory and run the `bootstrap.sh` script to set up symlinks to these dotfiles. This way you can version control just the dotfiles

## Why (and how)
Dotfiles allow you to customize your shell. When setting up a new machine it's nice to have all that config come with you. Hence we want to version control our dotfiles. The challenge is that these dotfiles are expected to live in a certain place on your machine. Typically your dotfiles have the following structure:

```
~/
  .bashrc
  .zshrc
  .gitconfig
  .tmux.conf
  ...
```

Now we can't reasonably version control all of `~`! There's a neat trick that gets around this. Clone `dotfiles` to ~ and use symlinks to reference them.

```
~/
  .bashrc -> ~/dotfiles/.bashrc
  ...
  dotfiles/
    .bashrc
    ...
```

This will redirect all requests for `~/.bashrc` to `~/dotfiles/.bashrc` (and so on), meaning that things will still work as expected. And now we can version control `~/dotfiles` and the problem is solved.

## Usage

Setting up a new machine for the first time:

```bash
# set up ssh
ssh-keygen -t rsa
less ~/.ssh/id_rsa.pub

#! manual step:
# copy ssh id to your github account
```

```
cd ~
git clone git@github.com:aminsaied/dotfiles.git
cd dotfiles
bash bootstrap.sh
```

**Note.** Running `sudo bash bootstrap.sh` will treat ~ directory as `/root`, not `/home/<user>`.

## SSH Agent

Goal: Use ssh-agent to forward ssh keys from my client (e.g. my laptop) to
the server (e.g. some azure vm). This allows you to interact with github
using your client ssh keys from the remote.

On client:
- My `.zshrc` starts up an agent and adds the ssh keys. Note: since I am using
  WSL I need to do this manually for each new shell, hence putting this in `.zshrc`.
  TODO: add this to `.profile`.

For new VM:
- Configure the VM in `~/.ssh/config` including `ForwardAgent yes` to enable
  agent forwarding.

  ```
  Host amsaied-ci
    HostName 52.250.36.122
    User azureuser
    Port 50000
    ForwardAgent yes
  ```

  **Note.** Alternatively, use `-A` flag with ssh: `ssh -A user@example`

## oh-my-zsh plugins

### zsh-syntax-highlighting
You'll need [this](https://github.com/zsh-users/zsh-syntax-highlighting) repo cloned into oh-my-zsh's plugins directory e.g. like this:
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Note - you may get a security warning about plugins. The warning will give you some options to address this.


## broot

[Broot](https://dystroy.org/broot/) is better way to navigate directories from your shell.

Download broot tool from [here](https://dystroy.org/broot/documentation/installation/). There are a number of download options, do this one for **Ubuntu on WSL**:

1. Download from pre-compiled binaries (target=Linux)
2. This will place the executable file `broot` somewhere like `C:\Users\<USER-NAME>\Downloads\broot`
3. Move this to `/usr/local/bin` with
    ```
    sudo mv /mnt/c/Users/<USER-NAME>/Downloads/broot /usr/local/bin/
    ```
4. Set `broot` to be executable with `chmod +x broot`
5. Finally, attempt to run `broot` and you will be met with the prompt to download https://github.com/Canop/broot. In particular, this will write the `br` shell function in `/home/<user>/.local/share/broot/launcher/bash/1` which is referenced in the `.zshrc` config.

**Note.** WSL has a keybinding assigned to `Alt`+`Enter` (toggles fullscreen) which conflicts with a vital command in broot: change directory. You can delete the WSL keybinding from settings > actions.

## Conda environments

Install / set up miniconda:

```
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh
rm -f Miniconda3-latest-Linux-x86_64.sh
```

You'll be prompted to answer some questions as part of the Miniconda install process. Nothing too taxing, I promise ;-)

## Windows Terminal Settings

I've included my settings for Windows Terminal. Unfortunately there is no magic syncing here, just meant for inspiration. You can edit your settings directly from the windows terminal by selecting "Settings" from the drop down menu.


## Vim

### YouCompleteMe

To get YCM plugin installed need to run:

```bash
sudo apt install build-essential cmake
```

Then change directory to the YCM plugin and run the install script

```bash
cd ~/.vim/plugged/YouCompleteMe
python3 install.py
```

TODO: add this to the `bootstrap.sh` script.

## Setup on WSL

First time running on WSL:

1. Clone `dotfiles` repo to ~/repos directory
2. Install zsh: `sudo apt update` and `sudo apt install zsh`. Now run `zsh` to launch the zsh shell
3. Run `bootstrap.sh`: cd to `~/repos/dotfiles` and run `bash bootstrap.sh` to create sym links
4. Install Oh-My-Zsh:
```
sudo apt install git-core curl fonts-powerline
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
5. Install zsh syntax highlighting plugin:
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
