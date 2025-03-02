-- config for language servers not supported by mason-lspconfig
return {
	"neovim/nvim-lspconfig",
	lazy = true,
	ft = {
		"sh", "bash", "zsh", "css", "graphql", "html", "json", "json5", "lua",
		"python", "rust", "svelte", "javascript"
	},
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("lspconfig").bacon_ls.setup({
			filetypes = { "rust" },
			root_dir = require("lspconfig/util").root_pattern(
				"Cargo.toml", "rust-project.json"
			),
			init_options = {
				-- 	updateOnSave = true,
				-- 	updateOnSaveWaitMillis = 1000,
				updateOnChange = true,
				-- 	runBaconInBackground = true,
				-- 	createBaconPreferencesFile = true,
			}
		})
	end
}
