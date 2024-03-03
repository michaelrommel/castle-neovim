-- overrides for silicon - tool to create code images
local utils = require("core.utils")
if utils.is_wsl or utils.is_linux then
	return {
		font = "VictorMono NF;Noto Emoji",
		to_clipboard = false,
		num_separator = "\u{258f} ",
		background_image = "/home/rommel/.local/share/assets/silicon-background.png",
	}
else
	if utils.is_mac then
		return {
			debug = true,
			-- disable_defaults = true,
			-- command = "/opt/homebrew/bin/silicon",
			-- command = "/Users/rommel/.local/share/mise/installs/rust/latest/bin/silicon"
			-- font = "VictorMono NF=34;Noto Emoji=34",
			-- to_clipboard = false,
			-- num_separator = "\u{258f} ",
			-- background_image = "/Users/rommel/.local/share/assets/silicon-background.png",
		}
	else
		return {}
	end
end
