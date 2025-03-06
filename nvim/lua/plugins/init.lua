return {
  -- Colorscheme
  { "catppuccin/nvim", name = "catppuccin" },
  
  -- Status line
  { "nvim-lualine/lualine.nvim" },
  
  -- File tree
  { "nvim-tree/nvim-tree.lua", dependencies = "nvim-tree/nvim-web-devicons" },
  
  -- Better syntax highlighting
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  
  -- Fuzzy finder
  { "nvim-telescope/telescope.nvim", dependencies = "nvim-lua/plenary.nvim" },
  
  -- Auto closing brackets/tags
  { "windwp/nvim-autopairs" },
  
  -- Startup screen
  { "goolord/alpha-nvim" },
}

