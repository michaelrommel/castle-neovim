local M = {}

-- local host = "127.0.0.1"
-- local port = 13333
local dap = require("dap")
local mr = require("mason-registry")
local code = mr.get_package("codelldb"):get_install_path()
local utils = require("core.utils")

local command = nil
local args = nil

if utils.is_mac then
	-- print(string.format("mac: %s", code))
	command = code .. "/extension/adapter/codelldb"
	args = {
		"--liblldb", code .. "/extension/lldb/lib/liblldb.dylib",
		"--settings", '{"showDisassembly": "never", "sourceLanguages": ["rust"]}'
	}
else
	-- print(string.format("linux: %s", code))
	command = code .. "/extension/adapter/codelldb"
	args = {
		"--liblldb", code .. "/extension/lldb/lib/liblldb.so",
		"--settings", '{"showDisassembly": "never", "sourceLanguages": ["rust"]}'
	}
end

M.setup = function()
	dap.adapters.codelldb = function(callback, config)
		callback({
			type = "server",
			port = "${port}",
			executable = {
				command = command,
				args = vim.list_extend({ "--port", "${port}" }, args)
			}
		})
	end
	dap.configurations.rust = {
		{
			type = "codelldb",
			request = "launch",
			name = "Debug",
			program = function()
				return vim.fn.input("exe: ", vim.fn.getcwd() .. "/target/debug/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
			showDisassembly = "never",
		},
	}
end

return M
