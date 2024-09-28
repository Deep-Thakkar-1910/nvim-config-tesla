return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_installed={"cpp","rust","lua","javascript","typescript","go","rust","json","jsdoc","sql"},
	  auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  }
}
