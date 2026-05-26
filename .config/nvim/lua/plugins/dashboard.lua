return {
	'nvimdev/dashboard-nvim',
	event = 'VimEnter',
	dependencies = { { 'nvim-tree/nvim-web-devicons' } },
	config = function()
		require('dashboard').setup({
		theme = 'doom',
		config = {
			header = {
				" ██████   █████ ██████████    ███████    █████   █████ █████ ██████   ██████",
				"░░██████ ░░███ ░░███░░░░░█  ███░░░░░███ ░░███   ░░███ ░░███ ░░██████ ██████ ",
				" ░███░███ ░███  ░███  █ ░  ███     ░░███ ░███    ░███  ░███  ░███░█████░███ ",
				" ░███░░███░███  ░██████   ░███      ░███ ░███    ░███  ░███  ░███░░███ ░███ ",
				" ░███ ░░██████  ░███░░█   ░███      ░███ ░░███   ███   ░███  ░███ ░░░  ░███ ",
				" ░███  ░░█████  ░███ ░   █░░███     ███   ░░░█████░    ░███  ░███      ░███ ",
				" █████  ░░█████ ██████████ ░░░███████░      ░░███      █████ █████     █████",
				"░░░░░    ░░░░░ ░░░░░░░░░░    ░░░░░░░         ░░░      ░░░░░ ░░░░░     ░░░░░ ",
				"",
				"",
				"",
			},
			center = {
			{
				icon = 'F ',
				icon_hl = 'Title',
				desc = 'Find File          ',
				desc_hl = 'String',
				key = 'f',
				key_hl = 'Number',
				key_format = ' [%s]',
				action = 'Telescope find_files',
			},
			{
				icon = 'N ',
				desc = 'New File           ',
				key = 'n',
				action = 'ene | startinsert',
			},
			{
				icon = 'C ',
				desc = 'Config Files       ',
				key = 'c',
				action = 'Neotree ~/.config/nvim'
			},
			{
				icon = 'Q ',
				desc = 'exit               ',
				key = 'q',
				action = 'q',
			}
			},
			footer = { "", "", "sphinx of black quartz, judge my vow" },
			vertical_center = true,
		},
		})
	end,
}
