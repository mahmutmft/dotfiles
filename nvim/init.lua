-- Set leader key to space (must be set before loading plugins)
vim.g.mapleader = " "
vim.g.maplocalleader = " " -- Optional: Set for filetype-specific mappings

-- Bootstrap Lazy.nvim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins from specifications
require("lazy").setup("plugins")

-- Basic settings
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.tabstop = 2          -- 2 spaces per tab
vim.opt.shiftwidth = 2       -- 2 spaces per indent
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.mouse = "a"          -- Enable mouse support

-- Plugin configurations

-- Catppuccin theme
require("catppuccin").setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  transparent_background = false,
})
vim.cmd.colorscheme("catppuccin")

-- Lualine status line
require("lualine").setup()

-- Nvim-tree file explorer
require("nvim-tree").setup()
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")

-- Telescope fuzzy finder
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fg", builtin.live_grep)

-- Auto pairs
require("nvim-autopairs").setup()

-- Treesitter
require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "python", "javascript", "typescript", "html", "css" },
  highlight = { enable = true },
})

-- Startup screen
require("alpha").setup(require("alpha.themes.startify").config)
