-- moves to the project's root dir
return {
	"notjedi/nvim-rooter.lua",
	lazy = true,
	event = "BufEnter",
	opts = {
		rooter_patterns = { ".git", "pyproject.toml" }
	}
}
