

vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")


vim.api.nvim_create_autocmd({"BufReadPost", "BufNewFile"}, {
    pattern = {"*.cpp", "*.c"},
    callback = function()
        local opt = vim.opt_local
        local map = vim.keymap.set


        opt.number = true
        opt.hlsearch = true
        opt.mousehide = true
        opt.visualbell = false
        opt.backspace = { "indent", "eol", "start" }
        opt.whichwrap:append("<,>,[,]")
        opt.tabstop = 4
        opt.shiftwidth = 4
        opt.softtabstop = 4
        opt.smarttab = true
        opt.autoindent = true
        opt.showtabline = 1
        opt.ruler = true
        opt.showmode = true
        opt.showcmd = true
        opt.termguicolors = true
        opt.background = "dark"


        local map_opts = { noremap = true, silent = true, buffer = true }
        map("i", "(", "()<Left>", map_opts)
        map("i", "[", "[]<Left>", map_opts)
        map("i", "{", "{}<Left>", map_opts)
        map("i", "<", "<><Left>", map_opts)
        map("i", "/", "//", map_opts)
        map("i", "*", "**<Left>", map_opts)
        map("i", "\"", "\"\"<Left>", map_opts)
        map("i", "'", "''<Left>", map_opts)


        vim.g.catppuccin_flavour = "macchiato"
        vim.cmd("colorscheme catppuccin_macchiato")

        
        print("C++ config applied!")


        local ok, lspconfig = pcall(require, "lspconfig")
        if ok then

            lspconfig.clangd.setup{
                on_attach = function(client, bufnr)

                    local cmp_ok, cmp = pcall(require, "cmp")
                    if cmp_ok then
                        cmp.setup.buffer({
                            sources = {
                                { name = "nvim_lsp" },
                                { name = "buffer" },
                                { name = "path" },
                            },
                            mapping = cmp.mapping.preset.insert({
                                ['<C-Space>'] = cmp.mapping.complete(),
                                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                            }),
                        })
                    end
                end,
            }
        end
    end,
})
