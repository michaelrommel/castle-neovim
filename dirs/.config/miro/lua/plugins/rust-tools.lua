-- zen mode and dimming
return {
	"simrat39/rust-tools.nvim",
	lazy = false,
	dependencies = {
		"neovim/nvim-lspconfig",
	},
	config = function()
		local rt = require("rust-tools")
		local mr = require("mason-registry")
		local code = mr.get_package("codelldb"):get_install_path()
		-- print(string.format("code: %s", code))
		local opts = {
			tools = {
				hover_actions = {
					auto_focus = true,
				},
			},
			dap = {
				adapter = require("rust-tools.dap").get_codelldb_adapter(
					code .. "/extension/adapter/codelldb",
					code .. "/extension/lldb/lib/liblldb.so"
				)
			},
			server = {
				on_attach = function(_, bufnr)
					-- Hover actions
					vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
					-- Code action groups
					--vim.keymap.set("n", "<Space>a", rt.code_action_group.code_action_group, { buffer = bufnr })
				end
			},
			settings = {
				['rust-analyzer'] = {
					cargo = {
						allFeatures = true,
						buildScripts = {
							enable = true,
						}
					},
					checkOnSave = {
						allFeatures = true,
						overrideCommand = {
							'cargo', 'clippy', '--workspace', '--message-format=json',
							'--all-targets', '--all-features'
						}
					},
				}
			},
		}
		rt.setup(opts)
	end
}
