local keys = {
	{ "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer search (espacio + /)" },
	{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers (espacio + fb)" },
	{ "<leader>fc", "<cmd>Telescope git_commits<cr>", desc = "Commits (espacio + fc)" },
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find All Files (espacio + ff)" },
	{ "<C-p>", "<cmd>Telescope git_files<cr>", desc = "Git files (Ctrl + p)" },
	{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help (espacio + fh)" },
	{ "<leader>fj", "<cmd>Telescope command_history<cr>", desc = "History (espacio + fj)" },
	{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps (espacio + fk)" },
	{ "<leader>fl", "<cmd>Telescope lsp_references<cr>", desc = "Lsp References (espacio + fl)" },
	{ "<leader>fi", "<cmd>Telescope lsp_implementations<cr>", desc = "Lsp Implementations (espacio + fi)" },
	{ "<leader>fd", "<cmd>Telescope lsp_definitions<cr>", desc = "Lsp Definitions (espacio + fd)" },
	{ "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Old files (espacio + fo)" },
	{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Ripgrep (espacio + fg)" },
	{ "<leader>fs", "<cmd>Telescope grep_string<cr>", desc = "Grep String (espacio + fs)" },
	{ "<leader>ft", "<cmd>Telescope treesitter<cr>", desc = "Treesitter (espacio + ft)" },
}

local config = function()
	local telescope = require("telescope")
	telescope.setup({
		defaults = {
			mappings = {
				i = {
					["<C-j>"] = "move_selection_next", -- Mover selección hacia abajo (Ctrl + j)
					["<C-k>"] = "move_selection_previous", -- Mover selección hacia arriba (Ctrl + k)
				},
			},
		},
		pickers = {
			live_grep = {
				file_ignore_patterns = { "node_modules", ".venv" },
				additional_args = function(_)
					return { "--hidden", "--no-ignore-vcs" }
				end,
				hidden = true,
				no_ignore = true,
			},
			find_files = {
				file_ignore_patterns = { "node_modules", ".venv" },
				additional_args = function(_)
					return { "--hidden", "--no-ignore-vcs" }
				end,
				no_ignore = true,
				hidden = true,
			},
		},
		extensions = {
			"fzf",
		},
	})
	telescope.load_extension("fzf")
end

return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
    name="Telescope",
	keys = keys,
	config = config,
}
