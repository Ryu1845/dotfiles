" Neomake
" call neomake#configure#automake('nrw', 50)

lua << EOF
--lualine
require("lualine").setup {options = {theme = "dracula"}}

--indent-blankline
require("indent_blankline").setup {
    char = "|",
    buftype_exclude = {"terminal"}
}

--format.nvim
require "format".setup {
    go = {
        {
            cmd = {"gofmt -w", "goimports -w"},
            tempfile_postfix = ".tmp"
        }
    },
    javascript = {
        {cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}
    },
    lua = {
        {
            cmd = {
                function(file)
                    return string.format("luafmt -l %s -w replace %s", vim.bo.textwidth, file)
                end
            }
        }
    },
    markdown = {
        {cmd = {"prettier -w"}},
        {
            cmd = {"black"},
            start_pattern = "^```python$",
            end_pattern = "^```$",
            target = "current"
        }
    },
    python = {
        {cmd = {"black"}},
        {cmd = {"isort"}}
    },
    rust = {
        {cmd = {"cargo fix"}},
        {cmd = {"cargo fmt"}}
    },
    vim = {
        {
            cmd = {"luafmt -w replace"},
            start_pattern = "^lua << EOF$",
            end_pattern = "^EOF$"
        }
    },
    vimwiki = {
        {
            cmd = {"prettier -w --parser babel"},
            start_pattern = "^{{{javascript$",
            end_pattern = "^}}}$"
        }
    },
    ["*"] = {
        {cmd = {"sed -i 's/[ \t]*$//'"}} -- remove trailing whitespace
    }
}

--qf_helper
require "qf_helper".setup()
EOF
