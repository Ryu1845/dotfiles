lua << EOF
nvim_lsp = require "lspconfig"
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = {"markdown", "plaintext"}
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = {valueSet = {1}}
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        "documentation",
        "detail",
        "additionalTextEdits"
    }
}

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {"pyright", "vimls"}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        -- on_attach = my_custom_on_attach,
        capabilities = capabilities
    }
end

-- luasnip setup
local luasnip = require "luasnip"

-- nvim-cmp setup
local cmp = require "cmp"
cmp.setup {
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.prev_item(),
        ["<C-n>"] = cmp.mapping.next_item(),
        ["<C-d>"] = cmp.mapping.scroll(-4),
        ["<C-f>"] = cmp.mapping.scroll(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        },
        ["<Tab>"] = cmp.mapping.mode(
            {"i", "s"},
            function(_, fallback)
                if vim.fn.pumvisible() == 1 then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, true, true), "n")
                elseif luasnip.expand_or_jumpable() then
                    vim.fn.feedkeys(
                        vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
                        ""
                    )
                else
                    fallback()
                end
            end
        ),
        ["<S-Tab>"] = cmp.mapping.mode(
            {"i", "s"},
            function(_, fallback)
                if vim.fn.pumvisible() == 1 then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-p>", true, true, true), "n")
                elseif luasnip.jumpable(-1) then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
                else
                    fallback()
                end
            end
        )
    },
    sources = {
        {name = "nvim_lsp"},
        {name = "luasnip"}
    }
}
require("rust-tools").setup({})
EOF
