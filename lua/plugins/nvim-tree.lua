return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			view = {
				width = 35,
			},
			-- change folder arrow icons
			renderer = {
				indent_markers = {
					enable = true,
				},
			},
			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
		})

		-- function to open nvim-tree in a floating window
		local function open_nvim_tree_float()
			-- open nvim-tree
			require("nvim-tree.api").tree.open()

			-- get the buffer ID of the nvim-tree
			local bufnr = vim.api.nvim_get_current_buf()

			-- Create a floating window for nvim-tree
			local width = vim.api.nvim_get_option("columns")
			local height = vim.api.nvim_get_option("lines")
			local win_width = math.ceil(width * 0.7)
			local win_height = math.ceil(height * 0.7)
			local row = math.ceil((height - win_height) / 2)
			local col = math.ceil((width - win_width) / 2)

			local opts = {
				relative = "editor",
				width = win_width,
				height = win_height,
				row = row,
				col = col,
				style = "minimal",
				border = "rounded",
			}

			-- open nvim-tree in the floating window and get window ID
			local win_id = vim.api.nvim_open_win(bufnr, true, opts)

			-- Map 'q' to close the floating window
			vim.api.nvim_buf_set_keymap(bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })

			-- Optional: Automatically focus the floating window when opened
			vim.api.nvim_set_current_win(win_id)
		end

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
		keymap.set(
			"n",
			"<leader>ef",
			"<cmd>NvimTreeFindFileToggle<CR>",
			{ desc = "Toggle file explorer on current file" }
		) -- toggle file explorer on current file
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer

		-- map for floating file explorer
		keymap.set("n", "<leader>eo", open_nvim_tree_float, { desc = "Open file explorer in a floating window" })
	end,
}
