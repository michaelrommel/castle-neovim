return {
	-- a TUI interface for the debug adapter
	"rcarriga/nvim-dap-ui",
	lazy = true,
	config = function()
		require("dapui").setup()
	end
}
