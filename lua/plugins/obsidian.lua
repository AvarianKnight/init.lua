return {
    "epwalsh/obsidian.nvim",
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
    -- event = { "BufReadPre " .. vim.fn.expand "~" .. "/obsidian*" },
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",

    },
    config = function()
        local path = vim.fn.has("unix") and "~/obsidian/Avarian" or "C:/Users/Skaggs/Documents/Vaults/Avarian"
        require("obsidian").setup({
            dir = path
        })
    end
}
