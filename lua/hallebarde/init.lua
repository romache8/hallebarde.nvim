local M = {}

M.setup = function()
	local palettes = {
		dark = {
			bg = "#12171D",
			fg = "#D8D8D8",
			red = "#E07A6E",
			redbg = "#2A1C1E",
			green = "#9AC495",
			greenbg = "#1B2820",
			purple = "#C89DE7",
			yellow = "#E0B772",
			yellowbg = "#2A251B",
			blue = "#70B2EE",
			bluebg = "#1B2A38",
			linecolumn = "#1C232B",
			select = "#2E3946",
			punctuation = "#8090A4",
		},
		light = {
			bg = "#F4F1EC",
			fg = "#242424",
			red = "#C7534D",
			redbg = "#FBE4E0",
			green = "#4B6A2C",
			greenbg = "#E6F3DC",
			purple = "#7557A6",
			yellow = "#8A7417",
			yellowbg = "#FFF2C4",
			blue = "#2B5C85",
			bluebg = "#E0ECF7",
			linecolumn = "#E3DFD7",
			select = "#D3DFEF",
			punctuation = "#9A9488",
		},
	}

	local style = vim.o.background
	local p = palettes[style]

	if not p then
		print("Defaulting to Light theme.")
		p = palettes["light"]
	end

	vim.api.nvim_create_augroup("HallebardeAutocmds", { clear = true })

	-- Clear existing syntax highlighting
	vim.cmd("hi clear")
	vim.cmd("hi clear Statement")
	vim.cmd("hi clear Special")

	-- base color
	vim.api.nvim_set_hl(0, "Normal", { fg = p.fg, bg = p.bg })

	-- visual selection
	vim.api.nvim_set_hl(0, "Visual", { fg = p.fg, bg = p.select })

	-- line highlight and columns
	vim.api.nvim_set_hl(0, "Cursor", { fg = p.fg, bg = p.bluebg })
	vim.api.nvim_set_hl(0, "lCursor", { fg = p.fg, bg = p.bluebg })
	vim.api.nvim_set_hl(0, "CursorIM", { fg = p.fg, bg = p.bluebg })
	vim.api.nvim_set_hl(0, "CursorLine", { fg = "NONE", bg = p.linecolumn })
	vim.api.nvim_set_hl(0, "CursorColumn", { fg = "NONE", bg = p.linecolumn })
	vim.api.nvim_set_hl(0, "ColorColumn", { fg = "NONE", bg = p.linecolumn })

	-- lighten the punctuation
	vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = p.punctuation })
	vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = p.punctuation })
	vim.api.nvim_set_hl(0, "@punctuation.special", { fg = p.punctuation })
	vim.api.nvim_set_hl(0, "MatchParen", { fg = p.blue, bg = p.bluebg })

	-- green for strings
	vim.api.nvim_set_hl(0, "@string", { fg = p.green, bg = p.greenbg })
	vim.api.nvim_set_hl(0, "@string.regexp", { fg = p.green, bg = p.greenbg })
	vim.api.nvim_set_hl(0, "@string.special", { fg = p.green, bg = p.greenbg })

	-- purple for constants, keywords, etc.
	vim.api.nvim_set_hl(0, "@constant", { fg = p.purple, bold = true })
	vim.api.nvim_set_hl(0, "@number", { fg = p.purple, bold = true })
	vim.api.nvim_set_hl(0, "@number.float", { fg = p.purple, bold = true })
	vim.api.nvim_set_hl(0, "@boolean", { fg = p.purple, bold = true })
	vim.api.nvim_set_hl(0, "@character", { fg = p.purple, bold = true })
	vim.api.nvim_set_hl(0, "@character.special", { fg = p.purple, bold = true })
	vim.api.nvim_set_hl(0, "@string.special.symbol", { fg = p.purple, bold = true })

	-- yellow for comments
	vim.api.nvim_set_hl(0, "@comment", { fg = p.yellow, bg = p.yellowbg })

	-- blue for global definitions
	vim.api.nvim_set_hl(0, "@function", { fg = p.blue, bg = p.bluebg })
	vim.api.nvim_set_hl(0, "@function.method", { fg = p.blue, bg = p.bluebg })
	vim.api.nvim_set_hl(0, "@lsp.type.namespace", { fg = p.blue, bg = p.bluebg })
	vim.api.nvim_set_hl(0, "@lsp.mod.declaration", { fg = p.blue, bg = p.bluebg })
	vim.api.nvim_set_hl(0, "@lsp.mod.definition", { fg = p.blue, bg = p.bluebg })
	vim.api.nvim_set_hl(0, "@lsp.type.function", { fg = "NONE", bg = "NONE" })
	vim.api.nvim_set_hl(0, "@lsp.type.method", { fg = "NONE", bg = "NONE" })
	vim.api.nvim_set_hl(0, "@lsp.type.macro", { fg = "NONE", bg = "NONE" })
	vim.api.nvim_set_hl(0, "@lsp.type.type", { fg = "NONE", bg = "NONE" })
	vim.api.nvim_set_hl(0, "@function.call", { fg = "NONE", bg = "NONE" })
	vim.api.nvim_set_hl(0, "@function.macro", { fg = "NONE", bg = "NONE" })
	vim.api.nvim_set_hl(0, "@function.method.call", { fg = "NONE", bg = "NONE" })
	vim.api.nvim_set_hl(0, "@class", { fg = p.blue, bg = p.bluebg })
	vim.api.nvim_set_hl(0, "@type.definition", { fg = p.blue, bg = p.bluebg })
	vim.api.nvim_set_hl(0, "@property", { fg = "NONE", bg = "NONE" })

	-- status line and pmenu
	vim.api.nvim_set_hl(0, "StatusLine", { fg = p.fg, bg = p.linecolumn })
	vim.api.nvim_set_hl(0, "StatusLineNC", { fg = p.fg, bg = p.linecolumn })
	vim.api.nvim_set_hl(0, "StatusLineTerm", { fg = p.fg, bg = p.select })
	vim.api.nvim_set_hl(0, "StatusLineTermNC", { fg = p.fg, bg = p.select })
	vim.api.nvim_set_hl(0, "TabLine", { fg = p.fg, bg = p.select })
	vim.api.nvim_set_hl(0, "TabLineFill", { fg = p.fg, bg = p.select })
	vim.api.nvim_set_hl(0, "Pmenu", { fg = p.fg, bg = p.linecolumn })
	vim.api.nvim_set_hl(0, "PmenuSel", { fg = p.fg, bg = p.select })
	vim.api.nvim_set_hl(0, "PmenuKind", { fg = p.fg, bg = p.linecolumn })
	vim.api.nvim_set_hl(0, "PmenuKindSel", { fg = p.fg, bg = p.select })
	vim.api.nvim_set_hl(0, "PmenuExtra", { fg = p.fg, bg = p.linecolumn })
	vim.api.nvim_set_hl(0, "PmenuExtraSel", { fg = p.fg, bg = p.select })

	-- buffer line
	vim.api.nvim_set_hl(0, "BufferCurrent", { fg = p.bg })
	vim.api.nvim_set_hl(0, "BufferCurrentBtn", { fg = p.bg })
	vim.api.nvim_set_hl(0, "BufferCurrentPin", { fg = p.bg })
	vim.api.nvim_set_hl(0, "BufferCurrentPinBtn", { fg = p.bg })
	vim.api.nvim_set_hl(0, "BufferCurrentIcon", { fg = p.bg })
	vim.api.nvim_set_hl(0, "BufferDefaultCurrent", { fg = p.bg })
	vim.api.nvim_set_hl(0, "BufferDefaultCurrentBtn", { fg = p.bg })
	vim.api.nvim_set_hl(0, "BufferDefaultCurrentPin", { fg = p.bg })
	vim.api.nvim_set_hl(0, "BufferDefaultCurrentPinBtn", { fg = p.bg })
	vim.api.nvim_set_hl(0, "BufferDefaultCurrentIcon", { fg = p.bg })

	-- clear existing filetype highlights for this theme
	vim.api.nvim_clear_autocmds({ group = "HallebardeAutocmds" })
end

return M
