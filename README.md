# Management of my dotfiles

## Quick start

This repository is powered by [dotbot](https://github.com/anishathalye/dotbot). 

After cloning this repo, running `install` will automatically deploy the dotfiles according to the config file `install.conf.yaml`. 
Running `install` multiple cause no side effects.

To clone all submodules in this repo (now mainly for vim plugins), using `git clone --recursive https://github.com/piaoliangkb/dotfiles.git ~/.dotfiles`.

Or you can use `git submodule init; git submodule update` in your existing cloned folder to initialize and update submodules. 

## Dotfiles description

- bash: `.bashrc`

- vim: `.vimrc`,  `.vim/`

- fish: `.config/fish/` 

- tmux: `.tmux.conf`

- git: `.gitconfig`, `.gitignore_global`

- clang: `.clang-format`

## Installation configuration

My config file is modified based on [anish's install configuration](https://github.com/anishathalye/dotfiles/blob/master/.install.conf.yaml).

Setting `force: true` will remove old dotfiles and relink them to those in this repo. (*Not recommended!!*)

By default, dotbot will not remove and relink your existing dotfiles.

[Dotbot configuration Docs](https://github.com/anishathalye/dotbot#configuration)

## Git submodules

Dotbot, vim plugins are git submodules of this repo.

Add dotbot as a submodule in this repo (see more details [here](https://github.com/anishathalye/dotbot/tree/5d83f9e797b1950199e127a8196803f5e33e0916#integrate-with-existing-dotfiles)):

```
git submodule add https://github.com/anishathalye/dotbot
```

Add vim plugins to specific folder:

```
git submodule add https://github.com/itchyny/lightline.vim .vim/pack/vendor/start/lightline
```

Remove specific submodule:

```
git rm .vim/pack/vendor/start/some-submodule
```

## Reference

1. [Anish: Managing Your Dotfiles](https://www.anishathalye.com/2014/08/03/managing-your-dotfiles/)

2. [MIT: Missing Semester: Command-line Environment Dotfiles](https://missing.csail.mit.edu/2020/command-line/)

3. [Github dotfiles page](https://dotfiles.github.io/)
