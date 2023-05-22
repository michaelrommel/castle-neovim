-- this extends the builtin treesitter and autoloads additional language
-- grammars when a buffer is opened
return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	event = { "BufEnter" },
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })
	end,
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			highlight = {
				enable = true,
			}
		})
	end
}
