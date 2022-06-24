#### Inspiration from my buddy https://github.com/leeren/dotfiles


# Dotfiles Management

The recommended way of syncing these dotfiles is using [GNU-stow](https://www.gnu.org/software/stow/). 

For Debian-like distributions, you would thus sync with your home directory as follows:

```bash
sudo apt install stow
stow vim bash ctags
```

For submodules, perform symlinks relative to where the submodule should be placed (i.e. in `vim/.vim/pack/plugins/start` run `ln -s ../../../../../submodules/submodule`). 

### Adding submodules

git submodule add https://github.com/preservim/nerdtree submodules/nerdtree

### Update submodules

git submodule update --remote



