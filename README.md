# vim-real-commenter

![muestra vim-real-commenter](https://github.com/dapt4/vim-real-commenter/assets/67972962/8086879d-aafa-499f-833d-5afcb050c528)

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
this plugin must be mapped for works, it is recommended:\
`noremap <C-7> :call SetComment(0)<CR>`\
`vnoremap <C-7> :<c-u> call SetComment(1)<CR>`


## Usage
Just go to the desired line and use your mapped keys (in the example: ctrl + 7), you can make a visual select and it will work correctly
