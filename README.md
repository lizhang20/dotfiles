# Management of My Dotfiles

This repository is powered by [dotbot](https://github.com/anishathalye/dotbot). After clone this repo, run `install` to set up the development environment automatically according to config file `install.conf.yaml`. Running multiple times of `install` will not cause side effects.

## Current dotfiles in this repo

- bash: `.bashrc`

- vim: `.vimrc`,  `.vim/`

- fish: `.config/fish/`

- tmux: `.tmux.conf`

- git: `.gitconfig`

- clang: `.clang-format`

- htop: `.config/htop/`

- pip: `.config/pip/`

## git submodules

Dotbot, vim plugins are git submodules of this repo.

Such as adding dotbot as a submodule in this repo (see more details [here](https://github.com/anishathalye/dotbot/tree/5d83f9e797b1950199e127a8196803f5e33e0916#integrate-with-existing-dotfiles)):

```
git submodule add https://github.com/anishathalye/dotbot
```

Add vim plugins to specific folder:

```
git submodule add https://github.com/itchyny/lightline.vim .vim/pack/vendor/start/lightline
```

## Installation configuration

My configuration is based on [anish's install configuration](https://github.com/anishathalye/dotfiles/blob/master/.install.conf.yaml).

I will set `force: true` to remove old dotfiles and relink them to those in this folder/repository. By default, dotbot will not remove and relink exist dotfiles.

[Dotbot configuration Docs](https://github.com/anishathalye/dotbot#configuration)

```yaml
# because of force flag = true, 
# note that using this script will symlink all config files shown in this directory to your machine.

- defaults:
    link:
      # when create is true, create parent directories to the link
      create: true
      # removes old target if it's a symlink
      relink: true
      # force removes the old target, file or folder
      # if you want to change all dotfiles on this machine to dotfiles in this folder, set force=true
      # force: true
      # glob treats * as a wildcard, so perform link operations on all matches
      glob: true
      
- clean: ['~', '~/.config']

- link:
    ~/.bashrc: .bashrc

    ~/.gitconfig: .gitconfig

    ~/.tmux.conf: .tmux.conf

    ~/.vim/: .vim/*

    ~/.vimrc: 
      path: .vimrc
      # always overwrite .vimrc
      force: true

    # fish, htop, pip
    ~/.config/: .config/*

    ~/.clang-format: .clang-format

- shell:
  # sometimes you will change your .gitmodules
  # git submodule sync to copy the new configuration from .gitmodules to .git/config
  - git submodule sync --recursive
```

## Ref links

1. [Anish: Managing Your Dotfiles](https://www.anishathalye.com/2014/08/03/managing-your-dotfiles/)

2. [MIT: Missing Semester: Command-line Environment Dotfiles](https://missing.csail.mit.edu/2020/command-line/)

3. [Github dotfiles page](https://dotfiles.github.io/)
