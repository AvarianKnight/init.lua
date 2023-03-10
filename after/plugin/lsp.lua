local lsp = require("lsp-zero")

vim.keymap.set("n", "<leader>fp", function()
    vim.lsp.buf.format()
end)

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'lua_ls',
    'rust_analyzer',
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

local function entry_filter(entry)
    local completion_type = require('cmp.types').lsp.CompletionItemKind[entry:get_kind()]
    return completion_type ~= "Snippet" and completion_type ~= "Text"
end

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    sources = cmp.config.sources({
        { name = "luasnip", entry_filter = entry_filter },
        { name = "nvim_lsp", entry_filter = entry_filter },
        { name = "buffer", entry_filter = entry_filter },
        { name = "nvim_lua", entry_filter = entry_filter },
        { name = "path", entry_filter = entry_filter },
    }),
    mapping = cmp_mappings
})

require "lsp_signature".setup({})

local rust_lsp = lsp.build_options('rust_analyzer', {})
require('rust-tools').setup({server = rust_lsp})

lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "citizen", "mysql", "vim", "vector3", "vector2", "vec3", "fx_version" },
            },
            completion = {
                autorequire = false
            },

            runtime = {
                version = "lua 5.4",
                plugin = "~/.config/lua/plugin.lua",
                nonstandardsymbol = {
                    "+=",
                    "-=",
                    "*=",
                    "/=",
                    "`"
                }
            },
            workspace = {
                library = {
                    [vim.fn.expand "$vimruntime/lua"] = true,
                    [vim.fn.expand "$vimruntime/lua/vim/lsp"] = true,
                    ["~/.config/lua/natives"] = true,
                    ["~/fxserver/server-data/resources/pma-framework"] = true,
                    ["~/fxserver/server/alpine/opt/cfx-server/citizen/scripting/lua"] = true,
                },
                type = {
                    weakunioncheck = true,
                    weaknilcheck = true,
                },
                maxpreload = 100000,
                preloadfilesize = 10000,
            },
        },
    },

})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>cs", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>cf", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>ca", "<Cmd> CodeActionMenu <CR>", opts)
    vim.keymap.set("n", "<leader>cr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>cn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>ci", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})
