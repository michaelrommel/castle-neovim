-- this ensures that mason autoinstalls the mentioned adapters
return {
	"jay-babu/mason-nvim-dap.nvim",
	lazy = true,
	ft = { "python", "javascript", "rust" },
	dependencies = {
		"williamboman/mason.nvim"
	},
	opts = {
		ensure_installed = { "js", "python", "codelldb" }
	}
}
