# vim-real-commenter


## Resume
this is a plugin for vim and nevim, for add comments to the code depending of the file type. This plugin supports more than 75 languages

## Install
You can add this plugin to your vim cloning my repo:
[https://github.com/dapt4/vim-real-commenter](https://github.com/dapt4/vim-real-commenter)
Or using a Plugin manager like:

"NeoBundle\
`NeoBundle 'dapt4/vim-real-commenter'`\
"or VimPlug\
`Plug 'dapt4/vim-real-commenter'`

:source %
:NeoBundleInstall
"or
:source %
:PlugInstall

## mappings
this plugin must be mapped for works, it is recommended:
noremap <C-_> :call SetComment(0)<CR>
vnoremap <C-_> :<c-u> call SetComment(1)<CR>


## Usage
Just go to the desired line and use your mapped keys, you can make a visual select and it will work correctly
