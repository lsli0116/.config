-- dap
local dap = require("dap")
local dap_install = require("dap-install")

-- for python
dap_install.config("python", {
	adapters = {
		type = "executable",
		command = os.getenv("CONDA_PREFIX") .. "/bin/python",
		args = { "-m", "debugpy.adapter" },
	},
	configurations = {
		{
			type = "python",
			request = "launch",
			name = "Launch file",

			program = "${file}",
			pythonPath = function()
				local cwd = vim.fn.getcwd()
				if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
					return cwd .. "/venv/bin/python"
				elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
					return cwd .. "/.venv/bin/python"
				else
					return os.getenv("CONDA_PREFIX") .. "/bin/python"
				end
			end,
		},
	},
})

-- for cpp
dap.adapters.lldb = {
	type = "executable",
	command = "lldb-vscode", -- adjust as needed
	name = "lldb",
}

dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},

		runInTerminl = true,
	},
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

vim.fn.sign_define("DapBreakpoint", {
	text = "",
	texthl = "LspDiagnosticsSignError",
	linehl = "",
	numhl = "",
})
vim.fn.sign_define("DapBreakpointRejected", {
	text = "",
	texthl = "LspDiagnosticsSignHint",
	linehl = "",
	numhl = "",
})
vim.fn.sign_define("DapStopped", {
	text = "",
	texthl = "LspDiagnosticsSignInformation",
	linehl = "DiagnosticUnderlineInfo",
	numhl = "LspDiagnosticsSignInformation",
})

-- dapui

local dapui = require("dapui")

dapui.setup({
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "k",
		repl = "r",
	},
	sidebar = {
		-- You can change the order of elements in the sidebar
		elements = {
			-- Provide as ID strings or tables with "id" and "size" keys
			{
				id = "scopes",
				size = 0.25, -- Can be float or integer > 1
			},
			{ id = "breakpoints", size = 0.25 },
			{ id = "stacks", size = 0.25 },
			{ id = "watches", size = 00.25 },
		},
		size = 40,
		position = "left", -- Can be "left", "right", "top", "bottom"
	},
	tray = {
		elements = { "repl" },
		size = 10,
		position = "bottom", -- Can be "left", "right", "top", "bottom"
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = "single", -- Border style. Can be "single", "double" or "rounded"
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
})

-- auto start dapui
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
-- nvim-dap-virtual-text
require("nvim-dap-virtual-text").setup()
