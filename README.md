# dotfiles
Version control for my dotfiles.

## why (and how)
Version controlling my dotfiles because I'm not a monster. Typically you have the following structure:

```
~/
  .bashrc
  ...
```

Clone `dotfiles` to ~ and use symlinks to refernce them

```
~/
  (symlink).bashrc
  dotfiles/
    .bashrc
```
