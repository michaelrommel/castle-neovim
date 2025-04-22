-- config for language servers not supported by mason-lspconfig
return {
	"neovim/nvim-lspconfig",
	lazy = true,
	ft = {
		"sh", "bash", "zsh", "css", "graphql", "html", "json", "json5", "lua",
		"python", "rust", "svelte", "javascript", "markdown"
	},
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"saghen/blink.cmp",
	},
	config = function()
		local on_attach = require("configs.conf_lsp").on_attach
		local capabilities = vim.tbl_deep_extend("force",
			vim.lsp.protocol.make_client_capabilities(),
			require("blink.cmp").get_lsp_capabilities({}, false)
		)
		require("lspconfig").bacon_ls.setup({
			filetypes = { "rust" },
			root_dir = require("lspconfig/util").root_pattern(
				"Cargo.toml", "rust-project.json"
			),
			on_attach = on_attach,
			capabilities = capabilities,
			init_options = {
				-- 	updateOnSave = true,
				-- 	updateOnSaveWaitMillis = 1000,
				updateOnChange = true,
				-- 	runBaconInBackground = true,
				-- 	createBaconPreferencesFile = true,
			}
		})
		require("lspconfig").harper_ls.setup({
			filetypes = { "markdown" },
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				["harper-ls"] = {
					userDictPath = os.getenv("HOME") .. "/.config/harper-ls/dictionary.txt",
					fileDictPath = os.getenv("HOME") .. "/.config/harper-ls/file_dictionaries",
					linters = {
						Dashes = false,
						SpellCheck = true,
						SpelledNumbers = false,
						SentenceCapitalization = false,
						WrongQuotes = false,
						ToDoHyphen = false,
					},
					codeActions = {
						ForceStable = false
					},
					markdown = {
						IgnoreLinkTitle = false
					},
					diagnosticSeverity = "hint",
					isolateEnglish = false,
					dialect = "British"
				}
			}
		})
	end
}
