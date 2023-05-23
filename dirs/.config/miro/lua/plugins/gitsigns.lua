-- lists git status and diff lines in the left signcolumn
return {
	"lewis6991/gitsigns.nvim",
	lazy = true,
	event = "BufEnter",
	config = function()
		local cm = require("core.mappings")
		require("gitsigns").setup({
			on_attach = cm.gitsigns_mappings
		})
	end
}
