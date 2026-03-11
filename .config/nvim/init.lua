_G._startup_time = vim.uv.hrtime()
-- ============================================================================
-- OPTIONS
-- ============================================================================
vim.opt.termguicolors = true
vim.opt.number = true -- line number
vim.opt.relativenumber = true -- relative line numbers
vim.opt.cursorline = true -- highlight current line
vim.opt.wrap = false -- do not wrap lines by default
vim.opt.scrolloff = 12 -- keep 8 lines above/below cursor
vim.opt.sidescrolloff = 12 -- keep 8 lines to left/right of cursor

vim.opt.tabstop = 4 -- tabwidth
vim.opt.shiftwidth = 4 -- indent width
vim.opt.softtabstop = 4 -- soft tab stop not tabs on tab/backspace
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.smartindent = true -- smart auto-indent
vim.opt.autoindent = true -- copy indent from current line

vim.opt.ignorecase = true -- case insensitive search
vim.opt.smartcase = true -- case sensitive if uppercase in string
vim.opt.hlsearch = true -- highlight search matches
vim.opt.incsearch = true -- show matches as you type

vim.opt.signcolumn = "yes" -- always show a sign column
vim.opt.showmatch = false -- highlights matching brackets
vim.opt.cmdheight = 1 -- single line command line
vim.opt.completeopt = "menuone,noinsert,noselect" -- completion options
vim.opt.showmode = false -- do not show the mode, instead have it in statusline
vim.opt.pumheight = 10 -- popup menu height
vim.opt.pumblend = 10 -- popup menu transparency
vim.opt.winblend = 0 -- floating window transparency
vim.opt.conceallevel = 0 -- do not hide markup
vim.opt.concealcursor = "" -- do not hide cursorline in markup
vim.opt.lazyredraw = true -- do not redraw during macros
vim.opt.synmaxcol = 300 -- syntax highlighting limit
vim.opt.fillchars = { eob = " " } -- hide "~" on empty lines

local undodir = vim.fn.expand("~/.vim/undodir")
if
	vim.fn.isdirectory(undodir) == 0 -- create undodir if nonexistent
then
	vim.fn.mkdir(undodir, "p")
end

vim.opt.backup = false -- do not create a backup file
vim.opt.writebackup = false -- do not write to a backup file
vim.opt.swapfile = false -- do not create a swapfile
vim.opt.undofile = true -- do create an undo file
vim.opt.undodir = undodir -- set the undo directory
vim.opt.updatetime = 300 -- faster completion
vim.opt.timeoutlen = 500 -- timeout duration
vim.opt.ttimeoutlen = 0 -- key code timeout
vim.opt.autoread = true -- auto-reload changes if outside of neovim
vim.opt.autowrite = false -- do not auto-save

vim.opt.hidden = true -- allow hidden buffers
vim.opt.errorbells = false -- no error sounds
vim.opt.backspace = "indent,eol,start" -- better backspace behaviour
vim.opt.autochdir = false -- do not autochange directories
vim.opt.iskeyword:append("-") -- include - in words
vim.opt.path:append("**") -- include subdirs in search
vim.opt.selection = "inclusive" -- include last char in selection
vim.opt.mouse = "a" -- enable mouse support
vim.opt.clipboard:append("unnamedplus") -- use system clipboard
vim.opt.modifiable = true -- allow buffer modifications
vim.opt.encoding = "utf-8" -- set encoding
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Folding: requires treesitter available at runtime; safe fallback if not
vim.opt.foldmethod = "expr" -- use expression for folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- use treesitter for folding
vim.opt.foldlevel = 99 -- start with all folds open

vim.opt.splitbelow = true -- horizontal splits go below
vim.opt.splitright = true -- vertical splits go right

vim.opt.wildmenu = true -- tab completion
vim.opt.wildmode = "longest:full,full" -- complete longest common match, full completion list, cycle through with Tab
vim.opt.diffopt:append("linematch:60") -- improve diff display
vim.opt.redrawtime = 10000 -- increase neovim redraw tolerance
vim.opt.maxmempattern = 20000 -- increase max memory

-- ============================================================================
-- KEYMAPS
-- ============================================================================
vim.g.mapleader = " " -- space for leader
vim.g.maplocalleader = " " -- space for localleader

-- better movement in wrapped text
vim.keymap.set("n", "j", function()
	return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true, desc = "Down (wrap-aware)" })
vim.keymap.set("n", "k", function()
	return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true, desc = "Up (wrap-aware)" })

vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { desc = "Clear search highlights", silent = true })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

vim.keymap.set("n", "dih", function()
	require("gitsigns").reset_hunk()
end, { desc = "Delete in hunk" })

vim.keymap.set("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>")
vim.keymap.set("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>")
vim.keymap.set("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>")
vim.keymap.set("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>")

-- vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
-- vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
-- vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
-- vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
-- vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
-- vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true })
vim.keymap.set("x", "x", '"_x', { noremap = true, silent = true })
vim.keymap.set("v", "x", '"_x', { noremap = true, silent = true })
vim.keymap.set("n", "c", '"_c')
vim.keymap.set("n", "C", '"_C')
vim.keymap.set("n", "cc", '"_cc')
vim.keymap.set("x", "c", '"_c')

vim.keymap.set("n", "<leader>pa", function() -- show file path
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end, { desc = "Copy full file path" })

vim.keymap.set("n", "<leader>td", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics" })
vim.keymap.set("n", "<leader>tw", function()
	vim.wo.wrap = not vim.wo.wrap
end, { desc = "Toggle wrap" })

-- ============================================================================
-- AUTOCMDS
-- ============================================================================

local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

-- Format on save (ONLY real file buffers, ONLY when efm is attached)
vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup,
	pattern = {
		"*.lua",
		"*.py",
		"*.go",
		"*.json",
		"*.sh",
		"*.bash",
		"*.zsh",
		"*.c",
		"*.cpp",
		"*.h",
		"*.hpp",
		"*.rs",
	},
	callback = function(args)
		-- avoid formatting non-file buffers (helps prevent weird write prompts)
		if vim.bo[args.buf].buftype ~= "" then
			return
		end
		if not vim.bo[args.buf].modifiable then
			return
		end
		if vim.api.nvim_buf_get_name(args.buf) == "" then
			return
		end

		local has_efm = false
		for _, c in ipairs(vim.lsp.get_clients({ bufnr = args.buf })) do
			if c.name == "efm" then
				has_efm = true
				break
			end
		end
		if not has_efm then
			return
		end

		pcall(vim.lsp.buf.format, {
			bufnr = args.buf,
			timeout_ms = 2000,
			filter = function(c)
				return c.name == "efm"
			end,
		})
	end,
})

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.hl.on_yank()
	end,
})

-- return to last cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup,
	desc = "Restore last cursor position",
	callback = function()
		if vim.o.diff then -- except in diff mode
			return
		end

		local last_pos = vim.api.nvim_buf_get_mark(0, '"') -- {line, col}
		local last_line = vim.api.nvim_buf_line_count(0)

		local row = last_pos[1]
		if row < 1 or row > last_line then
			return
		end

		pcall(vim.api.nvim_win_set_cursor, 0, last_pos)
	end,
})

-- wrap, linebreak and spellcheck on markdown and text files
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
	end,
})
-- ============================================================================
-- PLUGINS (vim.pack)
-- ============================================================================
vim.pack.add({
	"https://www.github.com/lewis6991/gitsigns.nvim",
	"https://www.github.com/echasnovski/mini.nvim",
	"https://www.github.com/ibhagwan/fzf-lua",
	"https://www.github.com/nvim-tree/nvim-tree.lua",
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
	},
	-- Language Server Protocols
	"https://www.github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/creativenull/efmls-configs-nvim",
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("1.*"),
	},
	"https://github.com/L3MON4D3/LuaSnip",
	"https://github.com/shaunsingh/nord.nvim",
	"https://github.com/kawre/leetcode.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/mrcjkb/rustaceanvim",
	"https://github.com/folke/which-key.nvim",
	"https://github.com/hedyhli/outline.nvim",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/folke/flash.nvim",
	"https://github.com/goolord/alpha-nvim",
	"https://github.com/christoomey/vim-tmux-navigator",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",
	"https://github.com/iamcco/markdown-preview.nvim",
	"https://github.com/bullets-vim/bullets.vim",
})

local function packadd(name)
	vim.cmd("packadd " .. name)
end
packadd("nvim-treesitter")
packadd("gitsigns.nvim")
packadd("mini.nvim")
packadd("fzf-lua")
packadd("nvim-tree.lua")
-- LSP
packadd("nvim-lspconfig")
packadd("mason.nvim")
packadd("efmls-configs-nvim")
packadd("blink.cmp")
packadd("LuaSnip")
packadd("plenary.nvim")
packadd("nui.nvim")
packadd("rustaceanvim")
packadd("render-markdown.nvim")
packadd("markdown-preview.nvim")
packadd("bullets.vim")

-- ============================================================================
-- TRANSPARENCY
-- ============================================================================

local function set_transparent() -- set UI component to transparent
	local groups = {
		"Normal",
		"NormalNC",
		"EndOfBuffer",
		"NormalFloat",
		"FloatBorder",
		"SignColumn",
		"StatusLine",
		"StatusLineNC",
		"TabLine",
		"TabLineFill",
		"TabLineSel",
		"ColorColumn",
	}
	for _, g in ipairs(groups) do
		vim.api.nvim_set_hl(0, g, { bg = "none" })
	end
	vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none", fg = "#767676" })
end

set_transparent()
vim.cmd.colorscheme("nord")
vim.cmd.hi("Comment gui=none")
-- Set transparency
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi NormalFloat guibg=NONE ctermbg=NONE")
vim.cmd("hi SignColumn guibg=NONE")
vim.cmd("hi FloatBorder guibg=NONE")
vim.cmd("hi CursorLine guibg=NONE")

-- ============================================================================
-- PLUGIN CONFIGS
-- ============================================================================

local setup_lualine = function()
	local lualine = require("lualine")

  -- Color table for highlights
  -- stylua: ignore
  local colors = {
    bg       = '#434c5e',
    fg       = '#d8dee9',
    yellow   = '#ebcb8b',
    cyan     = '#88c0d0',
    darkblue = '#5e81ac',
    green    = '#a3be8c',
    orange   = '#d08770',
    violet   = '#b48ead',
    blue     = '#81a1c1',
    red      = '#bf616a',
  }

	local conditions = {
		buffer_not_empty = function()
			return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
		end,
		hide_in_width = function()
			return vim.fn.winwidth(0) > 80
		end,
		check_git_workspace = function()
			local filepath = vim.fn.expand("%:p:h")
			local gitdir = vim.fn.finddir(".git", filepath .. ";")
			return gitdir and #gitdir > 0 and #gitdir < #filepath
		end,
	}

	local config = {
		options = {
			component_separators = "",
			section_separators = "",
			theme = {
				normal = { c = { fg = colors.fg, bg = colors.bg } },
				inactive = { c = { fg = colors.fg, bg = colors.bg } },
			},
		},
		sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_y = {},
			lualine_z = {},
			lualine_c = {},
			lualine_x = {},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_y = {},
			lualine_z = {},
			lualine_c = {},
			lualine_x = {},
		},
	}

	local function ins_left(component)
		table.insert(config.sections.lualine_c, component)
	end

	local function ins_right(component)
		table.insert(config.sections.lualine_x, component)
	end

	ins_left({
		function()
			return "   " .. string.upper(vim.fn.mode())
		end,
		color = function()
			local mode_color = {
				n = colors.red,
				i = colors.green,
				v = colors.blue,
				[""] = colors.blue,
				V = colors.blue,
				c = colors.violet,
				no = colors.red,
				s = colors.orange,
				S = colors.orange,
				[""] = colors.orange,
				ic = colors.yellow,
				R = colors.violet,
				Rv = colors.violet,
				cv = colors.red,
				ce = colors.red,
				r = colors.cyan,
				rm = colors.cyan,
				["r?"] = colors.cyan,
				["!"] = colors.red,
				t = colors.red,
			}
			return { fg = mode_color[vim.fn.mode()] }
		end,
		padding = { right = 1 },
	})

	ins_left({
		"filename",
		cond = conditions.buffer_not_empty,
		color = { fg = colors.green, gui = "bold" },
	})
	ins_left({
		"filesize",
		cond = conditions.buffer_not_empty,
	})

	ins_left({ "progress", color = { fg = colors.fg, gui = "bold" } })

	ins_left({
		"diagnostics",
		sources = { "nvim_diagnostic" },
		symbols = { error = " ", warn = " ", info = " " },
		diagnostics_color = {
			error = { fg = colors.red },
			warn = { fg = colors.yellow },
			info = { fg = colors.cyan },
		},
	})

	ins_right({
		"branch",
		icon = "",
		color = { fg = colors.violet, gui = "bold" },
	})

	ins_right({
		"diff",
		symbols = { added = " ", modified = " ", removed = " " },
		diff_color = {
			added = { fg = colors.green },
			modified = { fg = colors.orange },
			removed = { fg = colors.red },
		},
		cond = conditions.hide_in_width,
	})

	lualine.setup(config)
end

setup_lualine()

-- ALPHA
local setup_alpha = function()
	local alpha = require("alpha")
	local dashboard = require("alpha.themes.dashboard")
	dashboard.section.header.val = {
		[[                                                 ]],
		[[                                                 ]],
		[[                                                 ]],
		[[                                                 ]],
		[[                                                 ]],
		[[                                                 ]],
		[[                               __                ]],
		[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
		[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
		[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
		[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
		[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
	}

	dashboard.section.buttons.val = {
		dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
		dashboard.button("s", "  Find file ", ":FzfLua files<CR>"),
		dashboard.button("g", "  Grep ", ":FzfLua live_grep<CR>"),
		dashboard.button("q", "  Quit", ":qa<CR>"),
	}
	local elapsed_ms = (vim.loop.hrtime() - _G._startup_time) / 1e6

	dashboard.section.footer.val = {
		("Startup: %.2f ms"):format(elapsed_ms),
	}

	dashboard.config.opts.noautocmd = true

	alpha.setup(dashboard.config)
end

setup_alpha()

-- FLASH
require("flash").setup({
	modes = {
		search = { enabled = false },
		char = { enabled = false },
		treesitter = { enabled = false },
		remote = { enabled = false },
	},
})
vim.keymap.set({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end, { desc = "Flash" })

vim.keymap.set({ "n", "x", "o" }, "R", function()
	require("flash").treesitter()
end, { desc = "Flash Treesitter" })

vim.keymap.set("o", "r", function()
	require("flash").remote()
end, { desc = "Remote Flash" })

-- OIL
require("oil").setup({
	default_file_explorer = true,
	keymaps = {
		["l"] = "actions.select",
		["h"] = "actions.parent",
		["<CR>"] = "actions.select",
		["<C-s>"] = nil,
		["<C-h>"] = nil,
		["<C-l>"] = nil,
	},
	delete_to_trash = true,
	view_options = {
		show_hidden = true,
	},
	skip_confirm_for_simple_edits = true,
	float = {
		max_width = 80,
		max_height = 30,
		override = function(conf)
			return conf
		end,
	},
})
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "oil",
	callback = function()
		vim.opt_local.cursorline = true
	end,
})

-- OUTLINE
require("outline").setup({})

-- MARKDOWN BULLETS
vim.g.bullets_delete_last_bullet_if_empty = 1

-- RENDER MARKDOWN
require("render-markdown").setup({
	win_options = {
		conceallevel = { default = 0, rendered = 3 },
	},
	bullet = { enabled = true },
	latex = { enabled = false },
	checkbox = {
		enabled = true,
		position = "inline",
		unchecked = { icon = "   󰄱 ", highlight = "RenderMarkdownUnchecked" },
		checked = { icon = "   󰱒 ", highlight = "RenderMarkdownChecked" },
	},
	html = { enabled = true, comment = { conceal = false } },
	heading = {
		sign = false,
		icons = { " 󰎤 ", " 󰎧 ", " 󰎪 ", " 󰎭 ", " 󰎱 ", " 󰎳 " },
		backgrounds = { "Headline1Bg", "Headline2Bg", "Headline3Bg", "Headline4Bg", "Headline5Bg", "Headline6Bg" },
		foregrounds = { "Headline1Fg", "Headline2Fg", "Headline3Fg", "Headline4Fg", "Headline5Fg", "Headline6Fg" },
	},
	ft = { "markdown" },
})

local c = {
	fg = "#2e3440",
	red = "#bf616a",
	orange = "#d08770",
	yellow = "#ebcb8b",
	green = "#a3be8c",
	blue = "#5e81ac",
	violet = "#b48ead",
}
local hl = vim.cmd
hl(("highlight @markup.strong guifg=%s"):format(c.orange))
hl(("highlight @markup.italic guifg=%s"):format(c.orange))
hl(("highlight RenderMarkdownCodeInline guifg=%s"):format(c.green))
for i, col in ipairs({ c.red, c.orange, c.yellow, c.green, c.blue, c.violet }) do
	local n = tostring(i)
	hl(("highlight Headline%sBg guifg=%s guibg=%s"):format(n, c.fg, col))
	hl(("highlight Headline%sFg cterm=bold gui=bold guifg=%s"):format(n, col))
	hl(("highlight RenderMarkdownH%sBg guifg=%s guibg=%s"):format(n, c.fg, col))
	hl(("highlight RenderMarkdownH%s guifg=%s guibg=%s cterm=bold gui=bold"):format(n, col, c.fg))
end

-- toggle render markdown
vim.keymap.set("n", "<leader>or", function()
	local m = require("render-markdown")
	if require("render-markdown.state").enabled then
		m.disable()
	else
		m.enable()
	end
end, { desc = "Toggle Render Markdown" })

-- TREESITTER
local setup_treesitter = function()
	local treesitter = require("nvim-treesitter")
	treesitter.setup({})
	local ensure_installed = {
		"vim",
		"vimdoc",
		"rust",
		"c",
		"cpp",
		"go",
		"json",
		"lua",
		"markdown",
		"python",
		"bash",
		"lua",
		"python",
	}

	local config = require("nvim-treesitter.config")

	local already_installed = config.get_installed()
	local parsers_to_install = {}

	for _, parser in ipairs(ensure_installed) do
		if not vim.tbl_contains(already_installed, parser) then
			table.insert(parsers_to_install, parser)
		end
	end

	if #parsers_to_install > 0 then
		treesitter.install(parsers_to_install)
	end

	local group = vim.api.nvim_create_augroup("TreeSitterConfig", { clear = true })
	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		callback = function(args)
			if vim.list_contains(treesitter.get_installed(), vim.treesitter.language.get_lang(args.match)) then
				vim.treesitter.start(args.buf)
			end
		end,
	})
end

setup_treesitter()

-- NVIM-TREE

require("nvim-tree").setup({
	view = {
		side = "right",
		width = 60,
	},
	filters = {
		dotfiles = false,
	},
	renderer = {
		group_empty = true,
	},
	on_attach = function(bufnr)
		local api = require("nvim-tree.api")
		api.config.mappings.default_on_attach(bufnr)
		vim.keymap.set("n", "l", api.node.open.edit, { buffer = bufnr, silent = true })
		vim.keymap.set("n", "h", api.node.navigate.parent_close, { buffer = bufnr, silent = true })
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	group = augroup,
	callback = function()
		local wins = vim.api.nvim_list_wins()
		local non_tree_wins = vim.tbl_filter(function(w)
			local buf = vim.api.nvim_win_get_buf(w)
			return vim.bo[buf].filetype ~= "NvimTree"
		end, wins)
		if #non_tree_wins == 0 then
			vim.cmd("quit")
		end
	end,
})

vim.keymap.set("n", "<leader>e", function()
	require("nvim-tree.api").tree.open()
end, { desc = "Toggle NvimTree" })

vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "NvimTreeSignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { fg = "#2a2a2a", bg = "none" })
vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "none" })

-- WHICH-KEY
require("which-key").setup({
	win = {
		wo = {
			winblend = 0,
		},
	},
	preset = "helix",
	icons = {
		rules = false,
	},
	delay = 500,
	-- spec = {
	-- 	{ "<leader>c", group = "Code", mode = { "n", "x" } },
	-- 	{ "<leader>d", group = "Document" },
	-- 	{ "<leader>g", group = "Git" },
	-- 	{ "<leader>m", group = "Marks" },
	-- 	{ "<leader>r", group = "Rename" },
	-- 	{ "<leader>s", group = "Search" },
	-- 	{ "<leader>t", group = "Toggle" },
	-- 	{ "<leader>w", group = "Workspace" },
	-- 	{ "<leader>l", group = "LSP" },
	-- },
})

-- NOTIFICATION HISTORY
vim.keymap.set("n", "<leader>n", function()
	local notify = require("mini.notify")

	local history = notify.get_all and notify.get_all() or {}

	local lines = {}

	for _, item in ipairs(history) do
		local time = item.time and os.date("%H:%M:%S", item.time) or ""
		table.insert(lines, time .. " | " .. (item.msg or ""))
	end

	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

	local width = math.floor(vim.o.columns * 0.7)
	local height = math.floor(vim.o.lines * 0.7)

	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = math.floor((vim.o.lines - height) / 2),
		col = math.floor((vim.o.columns - width) / 2),
		style = "minimal",
		border = "rounded",
	})

	vim.bo[buf].buftype = "nofile"
	vim.bo[buf].swapfile = false

	vim.keymap.set("n", "q", function()
		if vim.api.nvim_win_is_valid(win) then
			vim.api.nvim_win_close(win, true)
		end
		if vim.api.nvim_buf_is_valid(buf) then
			vim.api.nvim_buf_delete(buf, { force = true })
		end
	end, { buffer = buf, silent = true })
end, { desc = "Show notification history" })

-- FZF-LUA

require("fzf-lua").setup({
	keymap = {
		builtin = {
			["<S-j>"] = "preview-page-down",
			["<S-k>"] = "preview-page-up",
		},
	},
	winopts = {
		row = 1,
		col = 0,
		width = 1,
		height = 0.4,
		title_pos = "left",
		preview = {
			layout = "horizontal",
			title_pos = "right",
		},
	},
})

vim.keymap.set("n", "<leader>s", function()
	require("fzf-lua").files()
end, { desc = "FZF Files" })
vim.keymap.set("n", "<leader>/", function()
	require("fzf-lua").live_grep()
end, { desc = "FZF Live Grep" })
vim.keymap.set("n", "<leader><leader>", function()
	require("fzf-lua").buffers()
end, { desc = "FZF Buffers" })
vim.keymap.set("n", "<leader>fh", function()
	require("fzf-lua").help_tags()
end, { desc = "FZF Help Tags" })
vim.keymap.set("n", "<leader>fx", function()
	require("fzf-lua").diagnostics_document()
end, { desc = "FZF Diagnostics Document" })
vim.keymap.set("n", "<leader>fX", function()
	require("fzf-lua").diagnostics_workspace()
end, { desc = "FZF Diagnostics Workspace" })

-- MINI
require("mini.surround").setup({})
-- require("mini.pairs").setup({})
require("mini.ai").setup({})
require("mini.comment").setup({})
local MiniNotify = require("mini.notify")

MiniNotify.setup({
	window = {
		winblend = 0,
	},
})

vim.notify = MiniNotify.make_notify({
	ERROR = { duration = 4000 },
	WARN = { duration = 3000 },
	INFO = { duration = 2000 },
	DEBUG = { duration = 0 },
	TRACE = { duration = 0 },
})
require("mini.icons").setup({})

require("gitsigns").setup({
	signs = {
		add = { text = "\u{2590}" }, -- ▏
		change = { text = "\u{2590}" }, -- ▐
		delete = { text = "\u{2590}" }, -- ◦
		topdelete = { text = "\u{25e6}" }, -- ◦
		changedelete = { text = "\u{25cf}" }, -- ●
		untracked = { text = "\u{25cb}" }, -- ○
	},
	signcolumn = true,
	current_line_blame = false,
})

-- MASON
require("mason").setup({})

-- GIT
vim.keymap.set("n", "]h", function()
	require("gitsigns").next_hunk()
end, { desc = "Next git hunk" })
vim.keymap.set("n", "[h", function()
	require("gitsigns").prev_hunk()
end, { desc = "Previous git hunk" })
vim.keymap.set("n", "<leader>hs", function()
	require("gitsigns").stage_hunk()
end, { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>hp", function()
	require("gitsigns").preview_hunk()
end, { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>hb", function()
	require("gitsigns").blame_line({ full = true })
end, { desc = "Blame line" })
vim.keymap.set("n", "<leader>hB", function()
	require("gitsigns").toggle_current_line_blame()
end, { desc = "Toggle inline blame" })
vim.keymap.set("n", "<leader>hd", function()
	require("gitsigns").diffthis()
end, { desc = "Diff this" })

-- LEET CODE
require("leetcode").setup({
	lang = "rust",
	storage = {
		home = vim.fn.expand("~/leetcode"),
		cache = vim.fn.stdpath("cache") .. "/leetcode",
	},
	image_support = false,
})

-- ============================================================================
-- LSP, Linting, Formatting & Completion
-- ============================================================================
local diagnostic_signs = {
	Error = " ",
	Warn = " ",
	Hint = "",
	Info = "",
}

vim.diagnostic.config({
	virtual_text = { prefix = "●", spacing = 4 },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = diagnostic_signs.Error,
			[vim.diagnostic.severity.WARN] = diagnostic_signs.Warn,
			[vim.diagnostic.severity.INFO] = diagnostic_signs.Info,
			[vim.diagnostic.severity.HINT] = diagnostic_signs.Hint,
		},
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
		focusable = false,
		style = "minimal",
	},
})

do
	local orig = vim.lsp.util.open_floating_preview
	function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
		opts = opts or {}
		opts.border = opts.border or "rounded"
		return orig(contents, syntax, opts, ...)
	end
end

local function lsp_on_attach(ev)
	local client = vim.lsp.get_client_by_id(ev.data.client_id)
	if not client then
		return
	end

	local bufnr = ev.buf
	local opts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set("n", "<leader>gd", function()
		require("fzf-lua").lsp_definitions({ jump_to_single_result = true })
	end, opts)

	vim.keymap.set("n", "<leader>gD", vim.lsp.buf.definition, opts)

	vim.keymap.set("n", "<leader>gS", function()
		vim.cmd("vsplit")
		vim.lsp.buf.definition()
	end, opts)

	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

	vim.keymap.set("n", "<leader>D", function()
		vim.diagnostic.open_float({ scope = "line" })
	end, opts)
	vim.keymap.set("n", "<leader>d", function()
		vim.diagnostic.open_float({ scope = "cursor" })
	end, opts)
	vim.keymap.set("n", "<leader>nd", function()
		vim.diagnostic.jump({ count = 1 })
	end, opts)

	vim.keymap.set("n", "<leader>pd", function()
		vim.diagnostic.jump({ count = -1 })
	end, opts)

	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

	vim.keymap.set("n", "<leader>fd", function()
		require("fzf-lua").lsp_definitions({ jump_to_single_result = true })
	end, opts)
	vim.keymap.set("n", "<leader>fr", function()
		require("fzf-lua").lsp_references()
	end, opts)
	vim.keymap.set("n", "<leader>ft", function()
		require("fzf-lua").lsp_typedefs()
	end, opts)
	vim.keymap.set("n", "<leader>fs", function()
		require("fzf-lua").lsp_document_symbols()
	end, opts)
	vim.keymap.set("n", "<leader>fw", function()
		require("fzf-lua").lsp_workspace_symbols()
	end, opts)
	vim.keymap.set("n", "<leader>fi", function()
		require("fzf-lua").lsp_implementations()
	end, opts)
end

vim.api.nvim_create_autocmd("LspAttach", { group = augroup, callback = lsp_on_attach })

vim.keymap.set("n", "<leader>q", function()
	vim.diagnostic.setloclist({ open = true })
end, { desc = "Open diagnostic list" })
vim.keymap.set("n", "<leader>dl", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

-- AUTOCOMPLETE
require("blink.cmp").setup({
	keymap = {
		preset = "default",
	},
	appearance = { nerd_font_variant = "mono" },
	completion = { menu = { auto_show = true } },
	sources = { default = { "lsp", "path", "buffer", "snippets" } },
	snippets = {
		expand = function(snippet)
			require("luasnip").lsp_expand(snippet)
		end,
	},

	fuzzy = {
		implementation = "prefer_rust",
		prebuilt_binaries = { download = true },
	},
})

vim.lsp.config["*"] = {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
}

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			telemetry = { enable = false },
		},
	},
})
vim.lsp.config("pyright", {
	settings = {
		pyright = {
			disableTaggedHints = true,
		},
		python = {
			pythonPath = vim.fn.getcwd() .. "/.venv/bin/python",

			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "workspace",
			},
		},
	},
})
vim.lsp.config("bashls", {})
vim.lsp.config("ts_ls", {})
vim.lsp.config("gopls", {})
vim.lsp.config("clangd", {})

local capabilities = vim.lsp.protocol.make_client_capabilities()

local ok, blink = pcall(require, "blink.cmp")
if ok then
	capabilities = blink.get_lsp_capabilities(capabilities)
end

vim.g.rustaceanvim = {
	tools = {
		enable_clippy = false,
	},
	server = {
		capabilities = capabilities,
		standalone = true,
		status_notify_level = false,
		load_vscode_settings = false,
		default_settings = {
			["rust-analyzer"] = {
				checkOnSave = false,
			},
		},
	},
}

do
	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")

	local flake8_base = require("efmls-configs.linters.flake8")

	local function resolve_flake8()
		local cwd = vim.fn.getcwd()
		local venv_flake8 = cwd .. "/.venv/bin/flake8"

		if vim.fn.executable(venv_flake8) == 1 then
			vim.notify("efm: using project flake8 → " .. venv_flake8, vim.log.levels.INFO)
			return venv_flake8
		end

		if vim.fn.executable("flake8") == 1 then
			return "flake8"
		end

		return nil
	end

	local flake8_cmd = resolve_flake8()

	local flake8 = nil
	if flake8_cmd then
		flake8 = vim.tbl_extend("force", flake8_base, {
			lintCommand = flake8_cmd .. " --max-line-length=999 --stdin-display-name ${INPUT} -",
		})
	end
	local black = require("efmls-configs.formatters.black")

	local prettier_d = require("efmls-configs.formatters.prettier_d")
	local eslint_d = require("efmls-configs.linters.eslint_d")

	local fixjson = require("efmls-configs.formatters.fixjson")

	local shellcheck = require("efmls-configs.linters.shellcheck")
	local shfmt = require("efmls-configs.formatters.shfmt")

	local cpplint = require("efmls-configs.linters.cpplint")
	local clangfmt = require("efmls-configs.formatters.clang_format")

	local go_revive = require("efmls-configs.linters.go_revive")
	local gofumpt = require("efmls-configs.formatters.gofumpt")

	local rustfmt = require("efmls-configs.formatters.rustfmt")

	local markdownlint = require("efmls-configs.linters.markdownlint")

	vim.lsp.config("efm", {
		filetypes = {
			"c",
			"cpp",
			"css",
			"go",
			"html",
			"javascript",
			"javascriptreact",
			"json",
			"jsonc",
			"lua",
			"markdown",
			"python",
			"sh",
			"typescript",
			"typescriptreact",
			"vue",
			"svelte",
		},
		init_options = { documentFormatting = true },
		settings = {
			languages = {
				c = { clangfmt, cpplint },
				go = { gofumpt, go_revive },
				cpp = { clangfmt, cpplint },
				css = { prettier_d },
				html = { prettier_d },
				javascript = { eslint_d, prettier_d },
				javascriptreact = { eslint_d, prettier_d },
				json = { eslint_d, fixjson },
				jsonc = { eslint_d, fixjson },
				lua = { luacheck, stylua },
				markdown = { markdownlint, prettier_d },
				python = { flake8, black },
				sh = { shellcheck, shfmt },
				typescript = { eslint_d, prettier_d },
				typescriptreact = { eslint_d, prettier_d },
				vue = { eslint_d, prettier_d },
				svelte = { eslint_d, prettier_d },
				rust = { rustfmt },
			},
		},
	})
end

vim.lsp.enable({
	"lua_ls",
	"pyright",
	"bashls",
	"ts_ls",
	"gopls",
	"clangd",
	"efm",
	"marksman",
})

if vim.g.neovide then
	vim.notify("neovide: " .. tostring(vim.g.neovide_version), vim.log.levels.INFO)
	vim.cmd("cd Documents/markdown")
	vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
	vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
	vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
	vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
end
