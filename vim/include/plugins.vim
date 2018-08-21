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
Plug 'sbdchd/neoformat'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'

Plug 'SirVer/ultisnips'

" Common programming / general development
Plug 'jiangmiao/auto-pairs'
if !(has('nvim'))
    Plug 'vim-scripts/AutoComplPop'
endif

Plug 'majutsushi/tagbar'
Plug 'w0rp/ale'

if (has('nvim'))
    Plug 'Shougo/context_filetype.vim'
    Plug 'Shougo/neco-vim'
    Plug 'Shougo/neco-syntax'
    Plug 'Shougo/neoinclude.vim'
    Plug 'Shougo/echodoc.vim'

    Plug 'roxma/nvim-completion-manager'
    Plug 'roxma/ncm-phpactor'
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
" CSS / SCSS
Plug 'cakebaker/scss-syntax.vim'

"Git
Plug 'tpope/vim-fugitive'

" Javascript
" Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'marijnh/tern_for_vim'

" Coffeescript O_o ?
Plug 'kchmck/vim-coffee-script'
if has('nvim')
    " Plug 'lukaszkorecki/CoffeeTags'
endif

" Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'

" Typescript
Plug 'leafgarland/typescript-vim'

" Markdown
Plug 'JamshedVesuna/vim-markdown-preview'

" Scala
Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' }
Plug 'derekwyatt/vim-scala'

call plug#end()
