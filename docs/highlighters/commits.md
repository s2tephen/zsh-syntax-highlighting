zsh-syntax-highlighting / highlighters / commits
------------------------------------------------

This is the `commits` highlighter, that highlights git commit messages that are too long.


### How to tweak it

This highlighter defines the following styles:

* `commits:softlimit` - the style for commit messages longer than 50 characters
* `commits:hardlimit` - the style for commit messages longer than 72 characters

To override one of those styles, change its entry in `ZSH_HIGHLIGHT_STYLES`,
for example in `~/.zshrc`:

    ZSH_HIGHLIGHT_STYLES[commits:softlimit]='fg=red'
    ZSH_HIGHLIGHT_STYLES[commits:hardlimit]='fg=red,bold'

The syntax for values is the same as the syntax of "types of highlighting" of
the zsh builtin `$zle_highlight` array, which is documented in [the `zshzle(1)`
manual page][zshzle-Character-Highlighting].

[zshzle-Character-Highlighting]: http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Character-Highlighting
