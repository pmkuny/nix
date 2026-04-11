{ pkgs, ... }: {
    
    programs.vim.extraConfig = ''
        set nocompatible
        syntax on
        filetype plugin on
        filetype indent on
        set noswapfile
        set visualbell
        colorscheme ron
        set number
        set autoread
        set ruler
        set laststatus=2
        set ignorecase
        set smartcase
        set hlsearch
        set incsearch
        set showmatch
        set tabstop=4
        set expandtab
        set list
        set listchars=tab:>~
        set shiftwidth=4
        set foldmethod=indent
'';
}
        
    
