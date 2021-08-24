" Required:
if has('vim_starting')
  set nocompatible
  set sessionoptions-=options
endif

" PLUGINS BUNDLE
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Plugs here:
call plug#begin(stdpath('config') . '/bundle')
" APPEARANCE
    Plug 'hoob3rt/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'dracula/vim', { 'as': 'dracula' }
" UTILITIES
    Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
    Plug 'jghauser/kitty-runner.nvim'
    Plug 'lukas-reineke/format.nvim'
" DEVELOPER
    Plug 'neovim/nvim-lspconfig'
    Plug 'simrat39/rust-tools.nvim'

    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'hrsh7th/cmp-nvim-lsp'

    Plug 'neomake/neomake'
    Plug 'stevearc/qf_helper.nvim'

    Plug 'tmhedberg/SimpylFold'
call plug#end()
