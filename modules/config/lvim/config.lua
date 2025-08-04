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

-- The setup config table shows all available config options with their default values:
require("neocord").setup({
    -- General options
    logo                = "auto",                     -- "auto" or url
    logo_tooltip        = "The best editor ever",                        -- nil or string
    main_image          = "language",                 -- "language" or "logo"
    client_id           = "1157438221865717891",      -- Use your own Discord application client id (not recommended)
    log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
    show_time           = true,                       -- Show the timer
    global_timer        = false,                      -- if set true, timer won't update when any event are triggered
    buttons             = nil,                        -- A list of buttons (objects with label and url attributes) or a function returning such list.

    -- Rich Presence text options
    editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
    terminal_text       = "Using Terminal",           -- Format string rendered when in terminal mode.
})


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
    'IogaMaster/neocord',
    event = "VeryLazy"
}
}
