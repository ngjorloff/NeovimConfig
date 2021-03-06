# Neovim Lua configuration

**You need to have Neovim version 0.5+!**

Get the nightly build or a 0.5+ version from here [Neovim releases](https://github.com/neovim/neovim/releases/).

For package management download and setup Packer [here](https://github.com/wbthomason/packer.nvim) (or clone directly using command below).

```ps1
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```

There are three types of configuration options:

* Globals options - vim.o
* Local to window - vim.wo
* Local to buffer - vim.bo

In order to get the `builtin.live_grep` function for Telescope working on Windows you might need to install [ripgrep](https://github.com/BurntSushi/ripgrep/releases) and add it to your `$PATH`.
