-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
local colors = {
	rosewater = '#f5e0dc',
	flamingo = '#f2cdcd',
	pink = '#f5c2e7',
	mauve = '#cba6f7',
	red = '#f38ba8',
	maroon = '#eba0ac',
	peach = '#fab387',
	yellow = '#f9e2af',
	green = '#a6e3a1',
	teal = '#94e2d5',
	sky = '#89dceb',
	sapphire = '#74c7ec',
	blue = '#89b4fa',
	lavender = '#b4befe',
	text = '#cdd6f4',
	subtext1 = '#bac2de',
	subtext0 = '#a6adc8',
	overlay2 = '#9399b2',
	overlay1 = '#7f849c',
	overlay0 = '#6c7086',
	suface2 = '#585b70',
	surface1 = '#45475a',
	surface0 = '#313244',
	base = '#1e1e2e',
	mantle = '#181825',
	crust = '#11111b'
}

local Catpuccin = {
	normal = {
    a = {bg = colors.flamingo, fg = colors.base, gui = 'bold'},
    b = {bg = colors.base, fg = colors.pink},
    c = {bg = colors.base, fg = colors.teal},
    x = {bg = colors.base, fg = colors.sky},
    y = {bg = colors.base, fg = colors.green},
    z = {bg = colors.base, fg = colors.flamingo}
  },
  insert = {
    a = {bg = colors.blue, fg = colors.base, gui = 'italic'},
    b = {bg = colors.base, fg = colors.pink},
    c = {bg = colors.base, fg = colors.teal},
    x = {bg = colors.base, fg = colors.sky},
    y = {bg = colors.base, fg = colors.green},
    z = {bg = colors.base, fg = colors.flamingo}
  },
  visual = {
		a = {bg = colors.green, fg = colors.base, gui = ''},
		b = {bg = colors.base, fg = colors.pink},
		c = {bg = colors.base, fg = colors.teal},
		x = {bg = colors.base, fg = colors.sky},
		y = {bg = colors.base, fg = colors.green},
		z = {bg = colors.base, fg = colors.flamingo}
  },
  replace = {
    a = {bg = colors.red, fg = colors.base, gui = ''},
    b = {bg = colors.base, fg = colors.pink},
    c = {bg = colors.base, fg = colors.teal},
    x = {bg = colors.base, fg = colors.sky},
    y = {bg = colors.base, fg = colors.green},
    z = {bg = colors.base, fg = colors.flamingo}
  },
  command = {
    a = {bg = colors.sky, fg = colors.base, gui = 'italic'},
    b = {bg = colors.base, fg = colors.pink},
    c = {bg = colors.base, fg = colors.teal},
    x = {bg = colors.base, fg = colors.sky},
    y = {bg = colors.base, fg = colors.green},
    z = {bg = colors.base, fg = colors.flamingo}
  },
  inactive = {
    a = {bg = colors.rosewater, fg = colors.base, gui = 'bold'},
    b = {bg = colors.base, fg = colors.pink},
    c = {bg = colors.base, fg = colors.teal},
    x = {bg = colors.base, fg = colors.sky},
    y = {bg = colors.base, fg = colors.green},
    z = {bg = colors.base, fg = colors.flamingo}
  }
}

return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	version = false,
	dependencies = { "SmiteshP/nvim-navic" },

	opts = {
		options = {
    icons_enabled = true,
    theme = Catpuccin,
    component_separators = {},
		section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = false,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
		},
		sections = {
			lualine_a = {
				{ 'mode', separator = { left = '', right = '' }, right_padding = 2 },
			},
			lualine_b = {
				'branch',
				'diff',
				'diagnostics'
			},
			lualine_c = {
				{
					function()
						local navic = require('nvim-navic')
						return navic.get_location()
					end,
					cond = function()
						local navic = require('nvim-navic')
						return navic.is_available()
					end
				},
			},
			lualine_x = {},
			lualine_y = {
				{'encoding', color = {fg = colors.sky}},
				{'filetype', icons_enabled = false, color = {fg = colors.sky}},
				'progress'
			},
			lualine_z = {'location'}
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {'filename'},
			lualine_x = {'location'},
			lualine_y = {},
			lualine_z = {}
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {'quickfix'}
	},

	config = function (_, opts)
		-- Inserts a component in lualine_c at left section
		local function ins_left(component)
			table.insert(opts.sections.lualine_c, component)
		end
		local function ins_right(component)
			table.insert(opts.sections.lualine_x, component)
		end

		ins_right {
			-- Lsp server name .
			function()
				local msg = 'No Active Lsp'
				local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
				local clients = vim.lsp.get_active_clients()
				if next(clients) == nil then
					return msg
				end
				for _, client in ipairs(clients) do
					local filetypes = client.config.filetypes
					if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
						return client.name
					end
				end
				return msg
			end,
			icon = '§ LSP:',
			color = { fg = colors.lavender, gui = 'bold' },
		}

		require'lualine'.setup(opts)
	end
  }
