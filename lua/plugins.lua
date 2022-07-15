-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- :PackerSync after finish changing this file always

function Get_setup(name)
	return string.format('require("setup/%s")', name)
end

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.vim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'					-- Package Manager
	use 'ray-x/aurora'
	use {																	-- hop
		'phaazon/hop.nvim',
		branch = 'v2', -- optional but strongly recommended
		config = function()
			Get_setup('hop')
			-- you can configure Hop the way you like here; see :h hop-config
			require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
		end
	}
  use 'neovim/nvim-lspconfig'						-- Configuration for Nvim LSP
  use {																	-- Treesitter model for syntax highlighting
		'nvim-treesitter/nvim-treesitter',
		config = Get_setup("nvim-treesitter"),
		run = ':TSUpdate'
	}
  use {																	-- Nvim Tree
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons',	-- optional, for file icons
		},
		tag = 'nightly',
		config = Get_setup('nvim-tree')
	}
  use 'dense-analysis/ale'							-- ALE anylitics tool
  use {
		'nvim-lualine/lualine.nvim',
		config = Get_setup("lualine"),
		event = "VimEnter",
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' } -- diffview.nvim

end)

