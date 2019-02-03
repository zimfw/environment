environment
===========

Sets sane Zsh built-in environment options.

Also enables smart URL-pasting. This prevents the user from having to manually escape URLs.

Settings
--------

By default, the history is set to be saved in `${ZDOTDIR:-${HOME}}/.zhistory`.
The file path can be customized with:

    HISTFILE=/path/to/.zsh_history

You can set a custom terminal title containing [prompt expansion escape sequences],
that is redrawn upon directory change. The example below sets the title to show
the current directory name:

    zstyle ':zim:environment' termtitle '%1~'

Zsh options
-----------

### Changing directories

  * `AUTO_CD` performs cd to a directory if the typed command is invalid, but is a directory.
  * `AUTO_PUSHD` makes cd push the old directory to the directory stack.
  * `PUSHD_IGNORE_DUPS` does not push multiple copies of the same directory to the stack.
  * `PUSHD_SILENT` does not print the directory stack after pushd or popd.
  * `PUSHD_TO_HOME` has pushd without arguments act like `pushd ${HOME}`.

### Expansion and globbing

  * `EXTENDED_GLOB` treats `#`, `~`, and `^` as patterns for filename globbing.

### History

  * `BANG_HIST` performs csh-style '!' expansion.
  * `HIST_IGNORE_ALL_DUPS` removes older command from the history if a duplicate is to be added.
  * `HIST_IGNORE_DUPS` does not enter immediate duplicates into the history.
  * `HIST_IGNORE_SPACE` removes commands from the history that begin with a space.
  * `HIST_SAVE_NO_DUPS` ommits older commands that duplicate newer ones when saving.
  * `HIST_VERIFY` doesn't execute the command directly upon history expansion.
  * `SHARE_HISTORY` causes all terminals to share the same history 'session'.


### Input/output

  * `INTERACTIVE_COMMENTS` allows comments starting with `#` in the shell.
  * `NO_CLOBBER` disallows `>` to overwrite existing files. Use `>|` or `>!` instead.

### Job control

  * `AUTO_RESUME` resumes an existing job before creating a new one.
  * `LONG_LIST_JOBS` lists jobs in verbose format by default.
  * `NOTIFY` reports job status immediately instead of waiting for the prompt.
  * `NO_BG_NICE` prevents background jobs being given a lower priority.
  * `NO_CHECK_JOBS` prevents status report of jobs on shell exit.
  * `NO_HUP` prevents SIGHUP to jobs on shell exit.

### Scripts and functions

  * `MULTIOS` performs implicit tees or cats when using multiple redirections.

[prompt expansion escape sequences]: http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
