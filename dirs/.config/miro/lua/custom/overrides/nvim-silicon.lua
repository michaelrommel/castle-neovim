-- overrides for silicon - tool to create code images
local is_wsl = (function()
	local output = vim.fn.systemlist "uname -r"
	return not not string.find(output[1] or "", "WSL")
end)()

local is_mac = (function()
	local output = vim.fn.systemlist "uname -s"
	return not not string.find(output[1] or "", "Darwin")
end)()

local is_linux = (function()
	local output = vim.fn.systemlist "uname -s"
	return not not string.find(output[1] or "", "Linux")
end)()

if is_wsl or is_mac or is_linux then
	return {
		font = "VictorMono NF;Noto Emoji",
		to_clipboard = false,
	}
else
	return {}
end
