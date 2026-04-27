{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withRuby = false;
    withPython3 = false;
    plugins = [ pkgs.vimPlugins.vim-colors-solarized ];
    extraConfig = ''
      set nocompatible
      syntax on
      filetype plugin on
      filetype indent on
      set autoindent
      set smartindent
      set rnu
      set noswapfile
      set visualbell
      colorscheme solarized
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
      set clipboard=unnamedplus
    '';
  };
}
