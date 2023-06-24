local lsp = require("lsp-zero")

vim.keymap.set("n", "<leader>fp", function()
    vim.lsp.buf.format({ async = true })
end)

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'lua_ls',
    'rust_analyzer',
    'omnisharp'
})

local cmp = require('cmp')
cmp.setup({
    preselect = cmp.PreselectMode.None
})
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

local function entry_filter(entry)
    local completion_type = require('cmp.types').lsp.CompletionItemKind[entry:get_kind()]
    return completion_type ~= "Snippet"
end

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    sources = cmp.config.sources({
        { name = "luasnip",  entry_filter = entry_filter },
        { name = "nvim_lsp", entry_filter = entry_filter },
        { name = "buffer",   entry_filter = entry_filter },
        { name = "nvim_lua", entry_filter = entry_filter },
        { name = "path",     entry_filter = entry_filter },
    }),
    mapping = cmp_mappings
})

local lsp_signature = require("lsp_signature")
lsp_signature.setup({})
lsp_signature.on_attach({
    doc_lines = 1,
})

local rust_lsp = lsp.build_options('rust_analyzer', {
    procMacro = {
        enable = true
    }
})
require('rust-tools').setup({ server = rust_lsp })



lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "Citizen", "mysql", "vim", "vector3", "vector2", "vec3", "fx_version" },
            },
            completion = {
                autorequire = false
            },
            runtime = {
                version = "lua 5.4",
                plugin = "~/.config/lua/plugin.lua",
                nonstandardSymbol = {
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
                    ["~/fxserver/server-data/resources/oxmysql"] = true,
                    ["~/fxserver/server/alpine/opt/cfx-server/citizen/scripting/lua"] = true,
                },
                type = {
                    weakUnionCheck = true,
                    weakNilCheck = true,
                },
                maxPreload = 100000,
                preloadfilesize = 10000,
            },
        },
    },
})

lsp.set_preferences({
    suggest_lsp_servers = false,
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    handle_ominisharp(client)

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
    update_in_insert = true,
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

local pid = vim.fn.getpid()

require("lspconfig").omnisharp.setup({
    handlers = {
        ["textDocument/definition"] = require('omnisharp_extended').handler,
    },
    cmd = { "/home/skaggs/.omnisharp/run", '--languageserver', '--hostPID', tostring(pid) },
})

function handle_ominisharp(client)
    if client.name == "omnisharp" then
        print(client.cmd)
        client.server_capabilities.semanticTokensProvider = {
            full = vim.empty_dict(),
            legend = {
                tokenModifiers = { "static_symbol" },
                tokenTypes = {
                    "comment",
                    "excluded_code",
                    "identifier",
                    "keyword",
                    "keyword_control",
                    "number",
                    "operator",
                    "operator_overloaded",
                    "preprocessor_keyword",
                    "string",
                    "whitespace",
                    "text",
                    "static_symbol",
                    "preprocessor_text",
                    "punctuation",
                    "string_verbatim",
                    "string_escape_character",
                    "class_name",
                    "delegate_name",
                    "enum_name",
                    "interface_name",
                    "module_name",
                    "struct_name",
                    "type_parameter_name",
                    "field_name",
                    "enum_member_name",
                    "constant_name",
                    "local_name",
                    "parameter_name",
                    "method_name",
                    "extension_method_name",
                    "property_name",
                    "event_name",
                    "namespace_name",
                    "label_name",
                    "xml_doc_comment_attribute_name",
                    "xml_doc_comment_attribute_quotes",
                    "xml_doc_comment_attribute_value",
                    "xml_doc_comment_cdata_section",
                    "xml_doc_comment_comment",
                    "xml_doc_comment_delimiter",
                    "xml_doc_comment_entity_reference",
                    "xml_doc_comment_name",
                    "xml_doc_comment_processing_instruction",
                    "xml_doc_comment_text",
                    "xml_literal_attribute_name",
                    "xml_literal_attribute_quotes",
                    "xml_literal_attribute_value",
                    "xml_literal_cdata_section",
                    "xml_literal_comment",
                    "xml_literal_delimiter",
                    "xml_literal_embedded_expression",
                    "xml_literal_entity_reference",
                    "xml_literal_name",
                    "xml_literal_processing_instruction",
                    "xml_literal_text",
                    "regex_comment",
                    "regex_character_class",
                    "regex_anchor",
                    "regex_quantifier",
                    "regex_grouping",
                    "regex_alternation",
                    "regex_text",
                    "regex_self_escaped_character",
                    "regex_other_escape",
                },
            },
            range = true,
        }
    end
end
