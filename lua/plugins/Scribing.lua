return {
	{
    'folke/which-key.nvim',
		event = {'BufReadPost'},
		opts = {},
    config = function(_, opts)
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('which-key').setup(opts)
    end,
  },

	{
		'echasnovski/mini.pairs',
		event = 'BufEnter',
		version = false,
		config = function (_, opts)
			require'mini.pairs'.setup(opts)
		end,
	},

	{
		'kylechui/nvim-surround',
		version = false,
		event = 'BufEnter',
		config = function (_, opts)
			require'nvim-surround'.setup(opts)
		end,
	},

	{
		'echasnovski/mini.comment',
		keys = {
			{"gcc", desc = "starts mini.comment"}
		},
		version = false,
		event = 'BufEnter',
		config = function (_, opts)
			require'mini.comment'.setup(opts)
		end
	},

	{
		"folke/twilight.nvim",
		lazy = true,
		opts = {
			dimming = {
				alpha = 0.25, -- amount of dimming
				-- we try to get the foreground from the highlight groups or fallback color
				color = { "Normal", "#ffffff" },
				term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
				inactive = true, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
			},
			context = 5, -- amount of lines we will try to show around the current line
			treesitter = false, -- use treesitter when available for the filetype
			-- treesitter is used to automatically expand the visible text,
			-- but you can further control the types of nodes that should always be fully expanded
			expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
				-- "function",
				-- "method",
				-- "table",
				-- "if_statement",
			},
			exclude = {}, -- exclude these filetypes
		}
	},

	{
		"folke/zen-mode.nvim",
		events = 'ZenMode',
		keys = {
			{"<leader>z", "<cmd>ZenMode<cr>", desc = "start ZenMode"}
		},
		opts = {
			window = {
				backdrop = 1.0, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
				-- height and width can be:
				-- * an absolute number of cells when > 1
				-- * a percentage of the width / height of the editor when <= 1
				-- * a function that returns the width or the height
				width = .60, -- width of the Zen window
				height = 1, -- height of the Zen window
				-- by default, no options are changed for the Zen window
				-- uncomment any of the options below, or add other vim.wo options you want to apply
				options = {
					signcolumn = "yes", -- disable signcolumn
					number = false, -- disable number column
					relativenumber = false, -- disable relative numbers
					-- cursorline = false, -- disable cursorline
					cursorcolumn = false, -- disable cursor column
					-- foldcolumn = "0", -- disable fold column
					-- list = false, -- disable whitespace characters
				},
			},
			plugins = {
				-- disable some global vim options (vim.o...)
				-- comment the lines to not apply the options
				options = {
					enabled = false,
					ruler = false, -- disables the ruler text in the cmd line area
					showcmd = false, -- disables the command in the last line of the screen
				},
				twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
				gitsigns = { enabled = false }, -- disables git signs
				tmux = { enabled = false }, -- disables the tmux statusline
				lualine = { enabled = false }, -- disables lualine
				navic = { enabled = false },
				vimtex = { enabled = false },
			},
			-- callback where you can add custom code when the Zen window closes
			-- on_close = function()
			-- end,
		}
	},

	{
		'lervag/vimtex',
		lazy = true,
		ft = {'latex', 'tex'},
	},

}
