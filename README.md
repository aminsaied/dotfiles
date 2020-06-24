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

## Conda environments

Bringing my conda environment yaml files with me. Build an environment `env.yml` with:

```bash
conda env create -f env.yml
```

And update with:

```bash
conda env update -f env.yml --prune
```

where the ``--prune`` flag will remove any dependencies that are no longer required.

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

TODO: add this to the `bootstrap.sh` script.
