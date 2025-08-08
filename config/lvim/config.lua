-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.colorscheme = "catppuccin"
lvim.transparent_window = true
lvim.builtin.lualine.style = "lvim"
lvim.builtin.lualine.options.theme = "catppuccin"

lvim.builtin.terminal.open_mapping = "`"



require("telescope").load_extension("noice")

require('cord').setup {
  editor = {
    icon = "https://github.com/IogaMaster/neocord/blob/main/assets/logos/Neovim.png?raw=true",
    tooltip = "The best editor like ever"
  },
  display = {
    theme = "atom",
    flavor = "accent"
  },
  idle = {
    enabled = false
  },
  
}



lvim.plugins = {
  {

  "olrtg/nvim-emmet",
  config = function()
    vim.keymap.set({ "n", "v" }, '<leader>xe', require('nvim-emmet').wrap_with_abbreviation)
  end,
  },
  { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},

  {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    -- "rcarriga/nvim-notify",
    }

  },

  {
  "shaunsingh/nord.nvim"
  },

  {
  "mellow-theme/mellow.nvim"
  },
  {
    "neanias/everforest-nvim",
  -- Optional; default configuration will be used if setup isn't called.
  },
  {
    "rose-pine/neovim"
  },
  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
  },
  {
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000
  },
  {
    "nyoom-engineering/oxocarbon.nvim"
  },
  {
    'vyfor/cord.nvim',
    build = ':Cord update',
  }

}
