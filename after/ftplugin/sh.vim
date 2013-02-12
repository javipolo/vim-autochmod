" Automatically set permissions for .sh files
" Copy or link to filetype.vim to enable autochmod for another filetype
" Copied from http://superuser.com/questions/393311/vim-creating-files
au BufWriteCmd <buffer> call s:BufWrite(expand("<afile>"))
function s:BufWrite(file)
    if v:cmdbang == 1
        let bang = "!"
    else
        let bang = ""
    endif

    if glob(a:file) != ""
        exe 'w'.bang a:file
    else
        try
            exe 'w'.bang a:file
        finally
            exe '!chmod u+x' a:file
        endtry
    endif
endfunction
