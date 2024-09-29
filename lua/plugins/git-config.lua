return {
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
			-- Actions
			vim.keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk <CR>")
			vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk <CR>")
			vim.keymap.set("n", "<leader>gS", ":Gitsigns stage_buffer <CR>")
			vim.keymap.set("n", "<leader>gu", ":Gitsigns undo_stage_hunk <CR>")
			vim.keymap.set("n", "<leader>gR",":Gitsigns reset_buffer <CR>")
			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk <CR>")
			vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame <CR>")
			vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis <CR>")
			vim.keymap.set("n", "<leader>td", ":Gitsigns toggle_deleted <CR>")
		end,
	},
}
