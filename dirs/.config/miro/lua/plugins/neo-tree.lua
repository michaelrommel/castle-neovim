-- explorer style tree on the left
return {
	"nvim-neo-tree/neo-tree.nvim",
	lazy = true,
	branch = "v3.x",
	event = "BufEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"s1n7ax/nvim-window-picker",
	},
	opts = {
		default_component_configs = {
			git_status = {
				symbols = {
					-- Change type
					added     = "+", -- or "✚", but this is redundant info if you use git_status_colors on the name
					modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
					deleted   = "✖", -- this can only be used in the git_status source
					renamed   = "󰁕", -- this can only be used in the git_status source
					-- Status type
					untracked = "",
					ignored   = "",
					unstaged  = "󰄱",
					staged    = "",
					conflict  = "",
				}
			}
		},
		window = {
			width = 50,
			mappings = {
				["<c-x>"] = "open_split",
				["<c-v>"] = "open_vsplit",
			}
		},
		filesystem = {
			filtered_items = {
				visible = false, -- when true, they will just be displayed differently than normal items
				hide_dotfiles = false,
				hide_gitignored = true,
			},
			use_libuv_file_watcher = true
		}
	}
}
