return {
	-- a TUI interface for the debug adapter
	"rcarriga/nvim-dap-ui",
	"nvim-neotest/nvim-nio",
	lazy = true,
	config = function()
		require("dapui").setup()
	end
}
