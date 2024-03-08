-- bare necessities statusline in vim, shows git status, filetype, encoding
-- and cursor position without much configuration
return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = function()
		local function active_lsps()
			local filetype = vim.bo.filetype
			local bufnr = vim.api.nvim_get_current_buf()
			local clients = vim.lsp.get_active_clients()
			local clients_list = {}
			for _, client in pairs(clients) do
				local filetypes = client.config.filetypes or {}
				for _, ft in pairs(filetypes) do
					if ft == filetype and client.attached_buffers[bufnr] then
						table.insert(clients_list, client.name)
					end
				end
			end
			return table.concat(clients_list, ", ")
		end

		require("lualine").setup({
			options = {
				ignore_focus = {
					"NvimTree",
				}
			},
			sections = {
				lualine_b = {
					{ 'branch', icon = '\u{f062c}' },
					'diff',
					'diagnostics'
				},
				lualine_x = {
					{ active_lsps, color = { fg = "#458588" } },
					'encoding', 'fileformat', 'filetype'
				},
				lualine_y = { "searchcount", "selectioncount", "progress" }
			}
		})
	end,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	}
}
