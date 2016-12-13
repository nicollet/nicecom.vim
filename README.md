# nicecom.vim
Simple comments, the way you want them

```bash
git clone git@github.com:nicollet/nicecom.vim.git
```

Add this to your .vimrc (or similar):
```vim
" comment the current line/region
if &runtimepath =~ 'nicecom'
	vnoremap <silent> <Leader>cc :Comment<cr>
	vnoremap <silent> <Leader>cu :Uncomment<cr>
	nnoremap <silent> <Leader>cc :Comment<cr>
	nnoremap <silent> <Leader>cu :Uncomment<cr>
endif
```

