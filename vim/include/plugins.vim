"""""""""" Plugin Installation """""""""" 

"""""""""" auto install plug-vim """""""""" 
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
"
""Style
Plug 'chriskempson/base16-vim'

" Tools 
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'keith/tmux.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-grepper'
Plug 'yssl/QFEnter'
Plug 'mattn/emmet-vim'
Plug 'chrisbra/Colorizer'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'

Plug 'SirVer/ultisnips'

" Common programming / general development
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
if !(has('nvim'))
    Plug 'vim-scripts/AutoComplPop'
endif

Plug 'majutsushi/tagbar'

if (has('nvim'))
    Plug 'Shougo/context_filetype.vim'
    Plug 'Shougo/neco-vim'
    Plug 'Shougo/neco-syntax'
    Plug 'Shougo/neoinclude.vim'
    Plug 'Shougo/echodoc.vim'

    Plug 'neoclide/coc.nvim', {'branch': 'release'}
else
    Plug 'Valloric/YouCompleteMe'
endif

" PHP
Plug 'reafle/vdebug'
Plug 'StanAngeloff/php.vim'
Plug 'lvht/phpcd.vim', { 'for': 'php', 'branch' : 'php5', 'do': 'composer update' }
Plug 'guenti/vim-php-cs-fixer'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'vim-php/tagbar-phpctags.vim'
Plug 'Rican7/php-doc-modded'
Plug 'qbbr/vim-symfony'
Plug 'docteurklein/php-getter-setter.vim'
Plug 'phpactor/phpactor' ,  {'do': 'composer install'}

" Twig / jinja2 syntax
Plug 'lumiliet/vim-twig'

" Ansible / YAML parsing
Plug 'chase/vim-ansible-yaml'

" HTML 
Plug 'alvan/vim-closetag'
Plug 'briancollins/vim-jst'
Plug 'nikvdp/ejs-syntax'

" Mustache
Plug 'mustache/vim-mustache-handlebars'

"Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'

" Typescript
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Markdown
Plug 'JamshedVesuna/vim-markdown-preview'

" Rockstar
Plug 'sirosen/vim-rockstar'

call plug#end()
