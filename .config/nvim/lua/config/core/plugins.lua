local pack = vim.pack

pack.add({
  -- LSP
  { src = "https://github.com/neovim/nvim-lspconfig" },  
  
  -- Markdown Rendering
  { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },  

  -- UI & Helpers
  { src = "https://github.com/folke/which-key.nvim" },
  { src = "https://github.com/echasnovski/mini.icons" },
  { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
  { src = "https://github.com/nvimdev/dashboard-nvim" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },  

  -- Colorscheme
  { src = "https://github.com/catppuccin/nvim" },  

  -- Syntax Highlighting Engine
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },  

  -- Navigation & Telescope
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/stevearc/oil.nvim" },  
  { src = "https://github.com/akinsho/bufferline.nvim" },

  -- Treesitter
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },  

  -- Completion
  { src = "https://github.com/hrsh7th/nvim-cmp" },
  { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
  { src = "https://github.com/hrsh7th/cmp-buffer" },
  { src = "https://github.com/hrsh7th/cmp-path" },  

  -- Formatting & Linting
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/mfussenegger/nvim-lint" },  

  -- Git
  { src = "https://github.com/lewis6991/gitsigns.nvim" },  

  -- DAP
  { src = "https://github.com/mfussenegger/nvim-dap" },
  { src = "https://github.com/rcarriga/nvim-dap-ui" },
  { src = "https://github.com/nvim-neotest/nvim-nio" },
  { src = "https://github.com/williamboman/mason.nvim" },
  { src = "https://github.com/jay-babu/mason-nvim-dap.nvim" },

  -- QoL
  { src = "https://github.com/folke/todo-comments.nvim" },
})
