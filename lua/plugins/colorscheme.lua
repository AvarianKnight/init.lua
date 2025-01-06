return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      vim.keymap.set("n", "<leader>cb", function()
        vim.o.background = vim.o.background == "light" and "dark" or "light"
        vim.cmd("hi NonText guifg=bg")
      end)

      require("gruvbox").setup({
        contrast = "hard",
      })

      vim.o.background = "dark"
      vim.cmd.colorscheme("gruvbox")
      vim.cmd("hi NonText guifg=bg")
    end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
