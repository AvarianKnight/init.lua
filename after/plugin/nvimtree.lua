require("nvim-tree").setup({
    filters = {
        dotfiles = true,
        custom = {"node_modules"}
    }
})

vim.keymap.set("n", "<C-n>", "<cmd> NvimTreeToggle <CR>")
vim.keymap.set("n", "<leader>e", "<cmd> NvimTreeFocus <CR>")
