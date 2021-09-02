[![nvim-ctrl-xplr.gif](https://s9.gifyu.com/images/nvim-ctrl-xplr.gif)](https://gifyu.com/image/GPIl)

Send files to running Neovim sessions using
[nvim-ctrl](https://github.com/chmln/nvim-ctrl).

Requirements
------------

- [Neovim](https://github.com/neovim/neovim)
- [nvim-ctrl](https://github.com/chmln/nvim-ctrl)


Installation
------------

### Install manually

- Add the following line in `~/.config/xplr/init.lua`

  ```lua
  package.path = os.getenv("HOME") .. '/.config/xplr/plugins/?/src/init.lua'
  ```

- Clone the plugin

  ```bash
  mkdir -p ~/.config/xplr/plugins

  git clone https://github.com/sayanarijit/nvim-ctrl.xplr ~/.config/xplr/plugins/nvim-ctrl
  ```

- Require the module in `~/.config/xplr/init.lua`

  ```lua
  require("nvim-ctrl").setup()
  
  -- Or
  
  require("nvim-ctrl").setup{
    mode = "default",
    keys = {
      ["ctrl-e"] = "tabedit",
      ["e"] = "e",
    },
  }

  -- Type `e` and enjoy.
  ```
