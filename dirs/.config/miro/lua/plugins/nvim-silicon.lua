-- create code images
local opts = {
	"michaelrommel/nvim-silicon",
	dir = '/Users/rommel/Software/michael/nvim-silicon',
	lazy = true,
	cmd = "Silicon",
	opts = {
		window_title = function()
			return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
		end,
	}
}
-- if an override exists, merge it in here
local exists, override = pcall(require, "custom.overrides.nvim-silicon")
if exists then
	opts.opts = opts.opts or {}
	for k, v in pairs(override) do opts.opts[k] = v end
end
return opts
