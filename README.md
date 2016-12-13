# nicecom.vim
Simple comments, the way you want them

## Install
If you use pathogen:
```bash
$ cd ~/.vim/bundle
$ git clone git@github.com:nicollet/nicecom.vim.git
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

## Usage

* To comment a line, press `cc`.
* To uncomment a line, press `cu`.
* To comment a region, press `v` then `cc`.
* To uncomment a region, press `v` then `cu`.
