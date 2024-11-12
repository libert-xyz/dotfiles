#### Inspiration from my buddy https://github.com/leeren/dotfiles


# Dotfiles Management

The recommended way of syncing these dotfiles is using [GNU-stow](https://www.gnu.org/software/stow/). 

For Debian-like distributions, you would thus sync with your home directory as follows:

```bash
sudo apt install stow
stow vim bash ctags
```

```bash
stow <packagename> # activates symlink
stow -n <packagename> # trial runs or simulates symlink generation. Effective for checking for errors
stow -D <packagename> # delete stowed package
stow -R <packagename> # restows package
```


### Adding submodules

git submodule add https://github.com/preservim/nerdtree vim/.vim/pack/plugins/start/nerdtree

### Update submodules

```
git submodule init
git submodule update --remote
```

# Scripts

Sysmlink to scripts folder is created manually

```bash
ln -s $HOME/dotfiles/scripts ~/
```


