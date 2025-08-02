require("lazy").setup({
  -- Autocompletion core
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "neovim/nvim-lspconfig",
  "L3MON4D3/LuaSnip",
  "rafamadriz/friendly-snippets",
  "saadparwaiz1/cmp_luasnip",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  -- File tree
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",

  -- Git integration
  "lewis6991/gitsigns.nvim",
  "tpope/vim-fugitive",

  -- Commenting
  "tpope/vim-commentary",

  -- Tmux
  "preservim/vimux",
  "christoomey/vim-tmux-navigator",

  "nvim-treesitter/nvim-treesitter",
  "norcalli/nvim-colorizer.lua",

  {
    "nvim-telescope/telescope.nvim", tag = "0.1.4",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
})

