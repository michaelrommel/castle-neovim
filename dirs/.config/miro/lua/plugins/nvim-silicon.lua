-- create code images
local opts = {
	"michaelrommel/nvim-silicon",
	lazy = true,
	cmd = "Silicon",
}
-- if an override exists, merge it in here
local exists, override = pcall(require, "custom.overrides.nvim-silicon")
if exists then
	for k, v in pairs(override) do opts[k] = v end
end
return opts
