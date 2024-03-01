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
			font = "VictorMono NF;Noto Emoji",
			to_clipboard = false,
			num_separator = "\u{258f} ",
			background_image = "/Users/rommel/.local/share/assets/silicon-background.png",
		}
	else
		return {}
	end
end
