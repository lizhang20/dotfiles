# Management of My Dotfiles

## Quick start

This repository is powered by [dotbot](https://github.com/anishathalye/dotbot). After clone this repo, run `install` to set up the development environment automatically according to config file `install.conf.yaml`. Running multiple times of `install` will not cause side effects.

To clone all submodules in this repo, use `git clone --recursive https://github.com/piaoliangkb/dotfiles.git ~/.dotfile`.

Or you can use `git submodule init; git submodule update` in your exist folder to clone submodules repos.

[Questions see here](https://stackoverflow.com/questions/43686630/gitsubmodules-are-not-being-pulled-when-cloning-project)

## Current dotfiles in this repo

- bash: `.bashrc`

- vim: `.vimrc`,  `.vim/`

- fish: `.config/fish/` 

- tmux: `.tmux.conf`

- git: `.gitconfig`, `.gitignore_global`

- clang: `.clang-format`


## Git submodules

Dotbot, vim plugins are git submodules of this repo.

Such as adding dotbot as a submodule in this repo (see more details [here](https://github.com/anishathalye/dotbot/tree/5d83f9e797b1950199e127a8196803f5e33e0916#integrate-with-existing-dotfiles)):

```
git submodule add https://github.com/anishathalye/dotbot
```

Add vim plugins to specific folder:

```
git submodule add https://github.com/itchyny/lightline.vim .vim/pack/vendor/start/lightline
```

Vim plugin: 

- `ale` use `shellcheck` to check shells.

- `ale` use `pylint` and `autopep8` for python codes.

## Installation configuration

My configuration is based on [anish's install configuration](https://github.com/anishathalye/dotfiles/blob/master/.install.conf.yaml).

I will set `force: true` to remove old dotfiles and relink them to those in this folder/repository. By default, dotbot will not remove and relink exist dotfiles.

[Dotbot configuration Docs](https://github.com/anishathalye/dotbot#configuration)


## Ref links

1. [Anish: Managing Your Dotfiles](https://www.anishathalye.com/2014/08/03/managing-your-dotfiles/)

2. [MIT: Missing Semester: Command-line Environment Dotfiles](https://missing.csail.mit.edu/2020/command-line/)

3. [Github dotfiles page](https://dotfiles.github.io/)
