vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = ' '
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.shiftwidth=4
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', {desc = 'Save'})
vim.keymap.set('', '<leader>ee', '<cmd>NvimTreeToggle<cr>', {desc = 'Explorer'})
vim.keymap.set('n', '<leader>;', '<cmd>noh<cr>', {desc = 'Clear highlight'})
vim.cmd([[
let g:airline_theme='alduin'
]])
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	print('Installing packer...')
	local packer_url = 'https://github.com/wbthomason/packer.nvim'
	vim.fn.system({'git', 'clone', '--depth', '1', packer_url, install_path})
	print('Done.')

	vim.cmd('packadd packer.nvim')
	install_plugins = true
end

require('packer').startup(function(use)
	use { "wbthomason/packer.nvim" }
	-- use 'github-user/repo'

	use 'folke/tokyonight.nvim'
	use 'dracula/vim'
	use { "catppuccin/nvim", as = "catppuccin" }

	use 'vim-airline/vim-airline'
	use 'pantharshit00/vim-prisma'
	use 'vim-airline/vim-airline-themes'
	use "windwp/nvim-ts-autotag"
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}
	use 'xiyaowong/nvim-transparent'
	use {'neoclide/coc.nvim', branch = 'release'}
	use 'nvim-tree/nvim-web-devicons'
	use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}
	-- use "glepnir/dashboard-nvim"
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use ({"ziontee113/color-picker.nvim",
	config = function()
		require("color-picker")
	end,
})

	use 'nvim-treesitter/nvim-treesitter'
	use 'rafcamlet/coc-nvim-lua'
	-- use({
	-- 	"iamcco/markdown-preview.nvim",
	-- 	run = function() vim.fn["mkdp#util#install"]() end,
	-- })

	use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
	use "cdelledonne/vim-cmake"
	use "rcarriga/nvim-notify"
	use {
	    'goolord/alpha-nvim',
	    requires = { 'nvim-tree/nvim-web-devicons' },
	    config = function ()
		require'alpha'.setup(require'alpha.themes.startify'.config)
	    end
	}

	if install_plugins then
		require('packer').sync()
	end
end)

if install_plugins then
	return
end

require("transparent").setup({
	enable = true, -- boolean: enable transparent
	extra_groups = { -- table/string: additional groups that should be cleared
	-- In particular, when you set it to 'all', that means all available groups

	-- example of akinsho/nvim-bufferline.lua
	"all",
},
exclude = {}, -- table: groups you don't want to clear
})

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		adaptive_size = true,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})

require('catpuccin-config')

vim.cmd('colorscheme catppuccin-mocha')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- require('dashboard-config')
require('color-picker-config')
require('barbar-config')
require('nvim-tree-config')
require('markdown-preview-config')
require('nvim-treesitter-config')
require('coc-config')

require('notify').setup({
    background_colour = "#000000",
})
