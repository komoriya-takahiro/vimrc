scriptencoding utf-8

"---------------------------------------------------------------------------
" プラットホーム依存の特別な設定

" WinではPATHに$VIMが含まれていないときにexeを見つけ出せないので修正
if has('win32') && $PATH !~? '\(^\|;\)' . escape($VIM, '\\') . '\(;\|$\)'
  let $PATH = $VIM . ';' . $PATH
endif

set nocompatible
filetype off

"" kaoriya固有の機能をoff
"if has('kaoriya')
"	let g:no_vimrc_example=0
"	let g:vimrc_local_finish=1
"	let g:gvimrc_local_finish=1
" 
"	"$VIM/plugins/kaoriya/autodate.vim
"	let plugin_autodate_disable  = 1
"	"$VIM/plugins/kaoriya/cmdex.vim
"	let plugin_cmdex_disable     = 1
"	"$VIM/plugins/kaoriya/dicwin.vim
"	let plugin_dicwin_disable    = 1
"	"$VIMRUNTIME/plugin/format.vim
"	let plugin_format_disable    = 1
"	"$VIM/plugins/kaoriya/hz_ja.vim
"	let plugin_hz_ja_disable     = 1
"	"$VIM/plugins/kaoriya/scrnmode.vim
"	let plugin_scrnmode_disable  = 1
"	"$VIM/plugins/kaoriya/verifyenc.vim
"	let plugin_verifyenc_disable = 1
"endif

"---------------------------------------------------------------------------
" NeoBundle
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif
  set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
let g:neobundle_default_git_protocol='https'

NeoBundleFetch 'Shougo/neobundle.vim'

" NeoBundle で管理するプラグイン
NeoBundle 'tpope/vim-pathogen'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'joonty/vdebug'
"NeoBundle 'Shougo/neomru.vim'
"NeoBundle 'nanotech/jellybeans.vim'
"NeoBundle 'Shougo/neosnippet'
"NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'LeafCage/yankround.vim'
NeoBundleLazy 'nosami/Omnisharp', {
\   'autoload': {'filetypes': ['cs']},
\   'build': {
\     'windows': 'MSBuild.exe server/OmniSharp.sln',
\     'mac': 'xbuild server/OmniSharp.sln',
\     'unix': 'xbuild server/OmniSharp.sln',
\   }
\ }

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

"---------------------------------------------------------------------------
" キーマップ

"---------------------------------------------------------------------------
" 履歴取得数
let g:yankround_max_history = 500

"---------------------------------------------------------------------------
" 検索の挙動に関する設定:
"
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase

"---------------------------------------------------------------------------
" 編集
" タブをスペースに展開する
"set noexpandtab
set expandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent
set ambiwidth=double
set formatoptions=q
set nobackup
set noundofile

"---------------------------------------------------------------------------
" 画面
" 行番号を非表示 (number:表示)
"set nonumber
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set nolist
" どの文字でタブや改行を表示するかを設定
"set listchars=tab:>-,extends:<,trail:-,eol:<
" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title
" escの2回押しでハイライト消去
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" colorscheme
syntax enable
if !has("gui_running")
  let g:solarized_termtrans=1
  let g:solarized_termcolors=256
  let g:solarized_visibility="high"
  let g:solarized_contrast="high"
endif
set background=light
colorscheme solarized

"---------------------------------------------------------------------------
set t_Co=256
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set fileencodings+=utf-8,euc-jp,iso-2022-jp,ucs-2le,ucs-2,euc-jp,cp932

if has('win32') || has ('win64')
  set iminsert=0
  set imsearch=0
endif

"---------------------------------------------------------------------------
"vdebug settings



"---------------------------------------------------------------------------
"lightline settings
"let g:lightline = {
"  \ 'colorscheme': 'solarized_dark',
"        \ 'mode_map': {'c': 'NORMAL'},
"        \ 'active': {
"        \   'left': [
"        \     ['mode', 'paste'],
"        \     ['fugitive', 'filename'],
"        \   ],
"        \   'right': [
"        \     ['lineinfo', 'syntastic'],
"        \     ['percent'],
"        \     ['charcode', 'fileformat', 'fileencoding', 'filetype'],
"        \   ]
"        \ },
"        \ 'component_function': {
"        \   'modified': 'MyModified',
"        \   'readonly': 'MyReadonly',
"        \   'fugitive': 'MyFugitive',
"        \   'filename': 'MyFilename',
"        \   'fileformat': 'MyFileformat',
"        \   'filetype': 'MyFiletype',
"        \   'fileencoding': 'MyFileencoding',
"        \   'mode': 'MyMode',
"        \   'syntastic': 'SyntasticStatuslineFlag',
"        \   'charcode': 'MyCharCode'
"        \ },
"  \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
"  \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" }
"  \ }
"
"function! MyModified()
"  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
"endfunction
"
"function! MyReadonly()
"  return &ft !~? 'help\|vimfiler\|gundo' && &ro ? "\u2b64" : ''
"endfunction
"
"function! MyFilename()
"  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
"        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
"        \  &ft == 'unite' ? unite#get_status_string() :
"        \  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
"        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
"        \ ('' != MyModified() ? ' ' . MyModified() : '')
"endfunction
"
"function! MyFugitive()
"  try
"    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
"      let _ = fugitive#head()
"      return strlen(_) ? "\u2b60"._ : ''
"    endif
"  catch
"  endtry
"  return ''
"endfunction
"
"function! MyFileformat()
"  return winwidth('.') > 70 ? &fileformat : ''
"endfunction
"
"function! MyFiletype()
"  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
"endfunction
"
"function! MyFileencoding()
"  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
"endfunction
"
"function! MyMode()
"  return winwidth('.') > 60 ? lightline#mode() : ''
"endfunction
"
"" https://github.com/Lokaltog/vim-powerline/blob/develop/autoload/Powerline/Functions.vim
"function! MyCharCode()
"  if winwidth('.') <= 70
"    return ''
"  endif
"
"  " Get the output of :ascii
"  redir => ascii
"  silent! ascii
"  redir END
"
"  if match(ascii, 'NUL') != -1
"    return 'NUL'
"  endif
"
"  " Zero pad hex values
"  let nrformat = '0x%02x'
"
"  let encoding = (&fenc == '' ? &enc : &fenc)
"
"  if encoding == 'utf-8'
"    " Zero pad with 4 zeroes in unicode files
"    let nrformat = '0x%04x'
"  endif
"
"  " Get the character and the numeric value from the return value of :ascii
"  " This matches the two first pieces of the return value, e.g.
"  " "<F>  70" => char: 'F', nr: '70'
"  let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')
"
"  " Format the numeric value
"  let nr = printf(nrformat, nr)
"
"  return "'". char ."' ". nr
"endfunction

"---------------------------------------------------------------------------
"omnisharp settings
filetype plugin on
let g:OmniSharp_host = "http://localhost:2000"
let g:OmniSharp_timeout=1
let g:OmniSharp_typeLookupInPreview=1
let g:OmniSharp_selector_ui='unite'
let g:OmniSharp_server_type='v1'
let g:syntastic_cs_checkers=['syntax', 'semantic', 'issues']
set noshowmatch
set completeopt=longest,menuone,preview
set splitbelow
set hidden

"---------------------------------------------------------------------------
"syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_php_phpcs_args = '--report=csv --standard=CakePHP'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"---------------------------------------------------------------------------
"neocomplete settings
"
""Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.cs = '.*[^=\);]'

