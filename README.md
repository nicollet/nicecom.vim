# nicecom.vim
Simple comments, the way you want them, only full lines.

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
	vnoremap <silent> <Leader>cc :NiceComment<cr>
	vnoremap <silent> <Leader>cu :NiceUncomment<cr>
	nnoremap <silent> <Leader>cc :NiceComment<cr>
	nnoremap <silent> <Leader>cu :NiceUncomment<cr>
endif
```

## Usage

My leader key is space.

* To comment a line, press `<space>cc`.
* To uncomment a line, press `<space>cu`.
* To comment a region, press `v` then `<space>cc`.
* To uncomment a region, press `v` then `<space>cu`.
