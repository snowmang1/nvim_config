
return {
	{
		'goolord/alpha-nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		event = "BufEnter",
		config = function ()
			require'alpha'.setup(require'alpha.themes.startify'.config)
		end,
	},

	{
		"rcarriga/nvim-notify",
		lazy = true,
		opts = {
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    },
	},

	{	-- Taken directly from LazyVIM
    "folke/noice.nvim",
		event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
    },
    -- stylua: ignore
    keys = {
      { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
      { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
      { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
      { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
      { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll forward", mode = {"i", "n", "s"} },
      { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll backward", mode = {"i", "n", "s"}},
    },
  },

	-- bufferline
  {
    "akinsho/bufferline.nvim",
		events = 'BufNew',
		opts = {
			options = {
				mode = "buffer",
				indicator = { style = 'icon' },
				buffer_close_icon = ' ',
				truncate_names = true,
				modified_icon = '●',
				left_trunc_marker = '',
				right_trunc_marker = '',
				separator_style = "",
				show_buffer_close_icons = false,
				show_close_icon = false,
				show_duplicate_prefix = false,
				show_buffer_icons = true,
				enforce_regular_tabs = true,
				always_show_bufferline = false,
				color_icons = true, -- whether or not to add the filetype icon highlights
				offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
			},
		}
  },

  { "nvim-tree/nvim-web-devicons", lazy = true },

	{
		'echasnovski/mini.indentscope',
		event = { "BufReadPre", "BufNewFile" },
		version = false,
		lazy = true,
		opts = {
			symbol = '│',
			options = { try_as_border = true },
		},
		init = function()
      vim.api.nvim_create_autocmd("FileType", { -- autocmd to stop the border from apearing on these filetypes
        pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
		config = function (_, opts)
			require('mini.indentscope').setup(opts)
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
        File          = " ",
        Module        = " ",
        Namespace     = " ",
        Package       = " ",
        Class         = " ",
        Method        = " ",
        Property      = " ",
        Field         = " ",
        Constructor   = " ",
        Enum          = "練",
        Interface     = "練",
        Function      = " ",
        Variable      = " ",
        Constant      = " ",
        String        = " ",
        Number        = " ",
        Boolean       = "◩ ",
        Array         = " ",
        Object        = " ",
        Key           = " ",
        Null          = "ﳠ ",
        EnumMember    = " ",
        Struct        = " ",
        Event         = " ",
        Operator      = " ",
        TypeParameter = " ",
    },
    highlight = false,
    separator = "  ",
    depth_limit = 4,
    depth_limit_indicator = "",
    safe_output = true
		},
		config = function (_,opts)
			require'nvim-navic'.setup(opts);
		end
	},

  { "MunifTanjim/nui.nvim", lazy = true },
}