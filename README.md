# my-fish-prompt

My personalized prompt for [Fish], adapted from and inspired by [daveverwer].

Looks best when using a [Monokai] color scheme (shown in the screenshots below)!

## Installation

### With [fisher]

```console
$ fisher add myklhenn/my-fish-prompt
```

### Manual Installation

Copy the contents of the `functions` folder in this repository to `~/.config/fish/functions` on your local machine.

## Screenshots

Normal prompt appearance indicates user name, host name, and current directory.

![prompt-normal]

The prompt's current directory indicator abbreviates parent directory names.

![prompt-directories]

The entire prompt turns red when the most recently run command ended with an error.

![prompt-error-status]

When in a git repository, the prompt displays the name of the current branch.

![prompt-repo-clean]

When in a dirty git repository, the prompt displays the name of the current branch in red and with an asterisk appended to the name.

![prompt-repo-dirty]

[Fish]: https://fishshell.com
[daveverwer]: https://github.com/robbyrussell/oh-my-zsh/wiki/Themes#daveverwer
[Monokai]: https://tmtheme-editor.herokuapp.com/#!/editor/theme/Monokai
[fisher]: https://github.com/jorgebucaran/fisher

[prompt-normal]: img/prompt-normal.png
[prompt-directories]: img/prompt-directories.png
[prompt-error-status]: img/prompt-error-status.png
[prompt-repo-clean]: img/prompt-repo-clean.png
[prompt-repo-dirty]: img/prompt-repo-dirty.png
