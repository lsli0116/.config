local util = require("lspconfig.util")
return {
	settings = {
		cmd = { "cmake-language-server" },
		filetypes = { "cmake" },
		init_options = {
			buildDirectory = "build",
		},
		root_dir = util.root_pattern(".git", "compile_commands.json", "build"),
		single_file_support = true,
	},
}
