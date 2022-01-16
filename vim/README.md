# The complete list of things to setup Vim

1. Create a config file named .vimrc in the home directory: `touch .vimrc`;
2. Copy the contents of the [vimrc](./vimrc) file to the created config file;
3. Install [vim-plug](https://github.com/junegunn/vim-plug#neovim) (a vim plugin manager);
5. Open any file and run `:PlugInstall`;
6. Configure Coc autocompletion and linting
    `vim -c 'CocInstall -sync coc-go coc-json|q'`
7. Add Coc config: run :CocConfig and add the following:

        {
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
        }

8. Run :GoInstallBinaries to deploy all the necessary language server tools.