augroup Format
    autocmd!
    autocmd BufWritePost * FormatWrite
augroup END

augroup Python
    autocmd!
    autocmd FileType python set makeprg=pylint\ --reports=n\ --msg-template=\"{path}:{line}:\ {msg_id}\ {symbol},\ {obj}\ {msg}\"\ %:p
    autocmd FileType python set errorformat=%f:%l:\ %m
    autocmd BufWritePost *.py :silent make
augroup END
