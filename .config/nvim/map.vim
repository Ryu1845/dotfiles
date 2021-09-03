" Bépo langmap
set langmap=$`,\\"1,«2,»3,(4,)5,@6,+7,-8,/9,*0,=-,%=,bq,éw,pe,or,èt,çy,vu,di,lo,jp,z[,w],aa,us,id,ef,\\,g,ch,tj,sk,rl,n\\;,m',ê<,àz,yx,xc,.v,kb,'n,qm,g\\,,h.,f/,#~,1!,2@,3#,4$,5%,6^,7&,8*,9(,0),°_,`+,BQ,ÉW,PE,OR,ÈT,ÇY,VU,DI,LO,JP,Z{,W},AA,US,ID,EF,\\;G,CH,TJ,SK,RL,N:,M\\",Ê>,ÀZ,YX,XC,:V,KB,?N,QM,G<,H>,F?

" Leader
map <space> \

" Quick Save
noremap <Leader>s :update<CR>

" Saner CTRL-L
nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

" Saner command-line history
cnoremap <expr> <c-n> wildmenumode() ? "\<c-n>" : "\<down>"
cnoremap <expr> <c-p> wildmenumode() ? "\<c-p>" : "\<up>"

" Saner behavior of n and N
nnoremap <expr> n  'Nn'[v:searchforward]
xnoremap <expr> n  'Nn'[v:searchforward]
onoremap <expr> n  'Nn'[v:searchforward]

nnoremap <expr> N  'nN'[v:searchforward]
xnoremap <expr> N  'nN'[v:searchforward]
onoremap <expr> N  'nN'[v:searchforward]

" Quickly add empty lines
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

" Open CHADTree (files)
nnoremap <leader>v <cmd>CHADopen<cr>

" Luasnip mappings
" imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
" inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
"
" snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
" snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
"
" imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
" smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

" Quick fix mappings
" use <C-N> and <C-P> for next/prev.
nnoremap <silent> <C-N> <cmd>QNext<CR>
nnoremap <silent> <C-P> <cmd>QPrev<CR>
" toggle the quickfix open/closed without jumping to it
nnoremap <silent> <leader>q <cmd>QFToggle!<CR>
nnoremap <silent> <leader>l <cmd>LLToggle!<CR>

" Split navigation
" set c-o to c-r
nnoremap <C-O> <C-R>
nnoremap <C-T> <C-W><C-J>
nnoremap <C-S> <C-W><C-K>
nnoremap <C-R> <C-W><C-L>
nnoremap <C-C> <C-W><C-H>
