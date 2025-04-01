-- moves to the project's root --[[ dir ]]
return {
	"notjedi/nvim-rooter.lua",
	lazy = true,
	event = "BufEnter",
	opts = {
		rooter_patterns = { "pyproject.toml", "package.json", "Cargo.toml", ".git" },
		exclude_filetypes = { "neo-tree", "oil" },
		fallback_to_parent = true,
	},
}
