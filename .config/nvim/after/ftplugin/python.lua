vim.api.nvim_create_autocmd("LspAttach", {
	callback = function()
		vim.lsp.handlers["$/progress"] = function() end
	end,
})
