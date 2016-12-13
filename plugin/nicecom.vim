"====================================================
"File: nicecom.vim
"Author: Xavier Nicollet
"Description: Vim plugin to comment/uncomment nicely
"====================================================

" Add this to your .vimrc (or similar):
" comment the current line/region
" if &runtimepath =~ 'nicecom'
" 	vnoremap <silent> <Leader>cc :Comment<cr>
" 	vnoremap <silent> <Leader>cu :Uncomment<cr>
" 	nnoremap <silent> <Leader>cc :Comment<cr>
" 	nnoremap <silent> <Leader>cu :Uncomment<cr>
" endif

if exists('g:loaded_nicecom') || &compatible
	finish
endif
let g:loaded_nicecom = 1

if v:version < 700
	echom "nicecom.vim needs vim >=7"
	finish
endif

let g:nice_comment_type = {
	\ 'vim': '"',
	\ 'sh': '#',
	\ 'python': '#'
	\ }

" Return the comment characters (default '//')
function! s:GetComment()
	if has_key(g:nice_comment_type, &filetype)
		return g:nice_comment_type[&filetype]
	endif
	return '//'
endfunction

" Get minimum offset needed for comments
function! s:GetMinOffset(firstl, lastl)
	let l:list = []
	for l:ln in range(a:firstl, a:lastl)
		let l:match = match(getline(l:ln), '\S')
		if l:match != -1
			let l:list += [l:match]
		endif
	endfor
	return min(l:list)
endfunction

function! g:NiceComment() range
	let l:comment = s:GetComment()

	" get the minimum offset
	let l:offset = s:GetMinOffset(a:firstline, a:lastline)

	for l:line in range(a:firstline, a:lastline)
		call cursor(l:line, offset + 1)
		let l:pos = getpos(".")
		execute "normal! i" . comment . " "
		if l:pos[2] != offset + 1
			execute "normal! =="
		endif
		call setline(l:line, substitute(getline("."), '\s*$', '', ''))
	endfor
endfunction

function! g:NiceUncomment() range
	let l:comment = s:GetComment()
	for l:line in range(a:firstline, a:lastline)
		let l:text = getline(l:line)
		let l:match = '^\s*'.comment.' \?'
		call setline(l:line, substitute(l:text, l:match, '', ''))
	endfor
endfunction

command! -range NiceComment <line1>,<line2>call g:NiceComment()
command! -range NiceUncomment <line1>,<line2>call g:NiceUncomment()



