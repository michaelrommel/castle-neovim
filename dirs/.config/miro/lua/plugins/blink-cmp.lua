return {
	'saghen/blink.cmp',
	-- optional: provides snippets for the snippet source
	dependencies = {
		'rafamadriz/friendly-snippets',
		'moyiz/blink-emoji.nvim',
		{
			'Kaiser-Yang/blink-cmp-dictionary',
			dependencies = { 'nvim-lua/plenary.nvim' }
		}
	},

	-- use a release tag to download pre-built binaries
	version = '1.*',
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',

	opts = {
		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		-- 'super-tab' for mappings similar to vscode (tab to accept)
		-- 'enter' for enter to accept
		-- 'none' for no mappings
		--
		-- All presets have the following mappings:
		-- C-space: Open menu or open docs if already open
		-- C-n/C-p or Up/Down: Select next/previous item
		-- C-e: Hide menu
		-- C-k: Toggle signature help (if signature.enabled = true)
		--
		-- See :h blink-cmp-config-keymap for defining your own keymap
		keymap = { preset = 'default' },

		appearance = {
			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = 'normal'
		},

		-- Default was to only show the documentation popup when manually triggered
		-- now enabled
		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 750,
			},
			ghost_text = {
				enabled = false,
			},
			menu = {
				auto_show = true,
				draw = {
					columns = {
						{ "kind_icon" },
						{ "label",      "label_description", gap = 1 },
						{ "source_name" },
					}
				}
			}
		},

		signature = { enabled = true },

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer', 'emoji', 'dictionary' },
			providers = {
				emoji = {
					module = "blink-emoji",
					name = "Emoji",
					score_offset = 5,
					opts = {
						insert = false,
					},
					should_show_items = function()
						return vim.tbl_contains(
							{ "gitcommit", "markdown" },
							vim.o.filetype
						)
					end
				},
				dictionary = {
					module = 'blink-cmp-dictionary',
					name = 'Dict',
					-- Make sure this is at least 2.
					-- 3 is recommended
					min_keyword_length = 3,
					max_items = 8,
					score_offset = -5,
					opts = {
						dictionary_directories = { vim.fn.expand('~/.config/dictionaries') }
					},
					should_show_items = function()
						return vim.tbl_contains(
							{ "gitcommit", "markdown" },
							vim.o.filetype
						)
					end
				},
				cmdline = {
					-- ignores cmdline completions when executing shell commands
					enabled = function()
						return vim.fn.getcmdtype() ~= ':' or not vim.fn.getcmdline():match("^[%%0-9,'<>%-]*!")
					end,
				}
			}
		},

		-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
		-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
		-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
		--
		-- See the fuzzy documentation for more information
		fuzzy = { implementation = "prefer_rust_with_warning" },

		cmdline = {
			completion = {
				menu = {
					auto_show = true,
				},
				ghost_text = {
					enabled = true,
				}
			}
		}
	},
	opts_extend = { "sources.default" }
}
