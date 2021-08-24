augroup Format
    autocmd!
    autocmd BufWritePost * FormatWrite
augroup END

autocmd FileType python set makeprg=pylint\ --reports=n\ --msg-template=\"{path}:{line}:\ {msg_id}\ {symbol},\ {obj}\ {msg}\"\ %:p
autocmd FileType python set errorformat=%f:%l:\ %m
autocmd FileType python :silent make
