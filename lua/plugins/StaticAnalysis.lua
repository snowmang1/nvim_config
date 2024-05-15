return {
	{
		'neovim/nvim-lspconfig',
		version = false,
		events = { "BufReadPre", "BufNewFile" },
		dependancies = {
			'williamboman/mason-lspconfig.nvim',
			'williamboman/mason.nvim',
		},
		config = function ()
			local navic = require("nvim-navic")
			-- custom on_attach to utilize navic
			require'lspconfig'.lua_ls.setup{
				on_attach = function(client, bufnr)
					navic.attach(client, bufnr)
				end
			}
			require'lspconfig'.clangd.setup{
				on_attach = function(client, bufnr)
					navic.attach(client, bufnr)
				end
			}
			require'lspconfig'.rust_analyzer.setup{
				on_attach = function(client, bufnr)
					navic.attach(client, bufnr)
				end
			}
			require'lspconfig'.hls.setup{
				autostart = false,
				on_attach = function(client, bufnr)
					navic.attach(client, bufnr)
				end
			}
			require'lspconfig'.grammarly.setup{
				autostart = false,
				filetypes = {'latex', 'tex', 'markdown'},
			}
		end,
	},

	{
		"SmiteshP/nvim-navic",
		lazy = true,
		event = 'LspAttach',
		version = false,
		dependencies = { "neovim/nvim-lspconfig" },
		opts = {
			icons = {
        File          = "₣ ",
        Module        = "£ ",
        Namespace     = "η ",
        Package       = "P ",
        Class         = "C ",
        Method        = "M ",
        Property      = "Þ ",
        Field         = "Џ ",
        Constructor   = "-|",
        Enum          = "",
        Interface     = "",
        Function      = "ƒ ",
        Variable      = "v ",
        Constant      = "c ",
        String        = "s ",
        Number        = "n ",
        Boolean       = "b ",
        Array         = "a ",
        Object        = "o ",
        Key           = " ",
        Null          = "∅ ",
        EnumMember    = "ε ",
        Struct        = "◯ ",
        Event         = "⇉ ",
        Operator      = "‼ ",
        TypeParameter = "λ ",
    },
    highlight = false,
    separator = " > ",
    depth_limit = 5,
    depth_limit_indicator = "∑",
    safe_output = true
		},
		config = function (_,opts)
			require'nvim-navic'.setup(opts);
		end
	},

	{
    'williamboman/mason-lspconfig.nvim',
		lazy = false, -- bridge between mason and nvim-lspconfig
		events = { 'BufReadPre', 'BufNewFile' },
		dependancies = {
			'williamboman/mason.nvim',
		},
		opts = {
			ensure_installed = { "hls", "lua_ls", "rust_analyzer", "clangd", "grammarly"},
			automatic_installation = true,
		},
		config = function (_, opts)
			require'mason-lspconfig'.setup(opts)
		end,
	},

	{
		'williamboman/mason.nvim',
		lazy = true,
		cmd = 'Mason',
		config = function (_, opts)
			require'mason'.setup(opts)
		end,
	},
}
