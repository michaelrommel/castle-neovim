-- overrides for silicon - tool to create code images
local utils = require("core.utils")
if utils.is_wsl or utils.is_linux then
	return {
		to_clipboard = false,
		background_image = "/home/rommel/.local/share/assets/silicon-background.png",
	}
else
	if utils.is_mac then
		return {
			-- command = "/opt/homebrew/bin/silicon",
			background_image = "/Users/rommel/.local/share/assets/silicon-background.png",
		}
	else
		return {}
	end
end
