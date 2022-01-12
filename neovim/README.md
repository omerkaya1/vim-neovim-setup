# The complete list of things to setup NeoVim

1. Install the [nvim](https://github.com/neovim/neovim/wiki/Installing-Neovim#homebrew-on-macos-or-linux);
2. Create a config file named init.vim inside the ~/.config/nvim directory;
3. Copy the contents of the [init.vim](./init.vim) file to the created config file;
4. Install [vim-plug](https://github.com/junegunn/vim-plug#neovim) (a vim plugin manager);
5. Add a new file for plugins (optional, everything is in init.vim anyways)
    mkdir ~/.config/nvim/vim-plug
6. Open any file and run `:PlugInstall`
7. Configure Coc autocomplition and linting
    ``vim -c 'CocInstall -sync coc-go coc-html coc-css coc-json|q'``
8. Add Coc config: run :CocConfig and add the following:

    ``{
  "suggest.noselect": false,
  "diagnostic.errorSign": "✘",
  "diagnostic.warningSign": "!",
  "diagnostic.infoSign": "?",
  "diagnostic.checkCurrentLine": true,
  "coc.preferences.formatOnSaveFiletypes": [
    "html",
    "json",
    "css",
    "scss",
    "go",
    "rs',
    "ts"
  ],
  "coc.preferences.hoverTarget": "float",
  "languageserver": {
    "golang": {
      "command": "gopls",
      "rootPatterns": ["go.mod"],
      "filetypes": ["go"]
    }
  },
  "go.goplsOptions": {
    "staticcheck": true
  }
}``

Note: Coc requires Node installed?? Bummer.

9. Run :GoInstallBinaries to deploy all the necessary language server tools