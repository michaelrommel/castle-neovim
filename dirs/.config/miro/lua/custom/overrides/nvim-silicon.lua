-- overrides for silicon - tool to create code images
local is_wsl = (function()
	local output = vim.fn.systemlist "uname -r"
	return not not string.find(output[1] or "", "WSL")
end)()

if is_wsl then
	return {
		font = "VictorMono NF;Noto Emoji",
		to_clipboard = false,
	}
else
	return {}
end
