environment
===========

Sets sane Zsh built-in environment options.

Settings
--------

By default, the history is set to be saved in `${ZDOTDIR:-${HOME}}/.zhistory`.
The file path can be customized with:

    HISTFILE=/path/to/.zsh_history

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

  * `HIST_FIND_NO_DUPS` does not display duplicates when searching the history.
  * `HIST_IGNORE_DUPS` does not enter immediate duplicates into the history.
  * `HIST_IGNORE_SPACE` removes commands from the history that begin with a space.
  * `HIST_VERIFY` doesn't execute the command directly upon history expansion.
  * `SHARE_HISTORY` causes all terminals to share the same history 'session'.

### Input/output

  * `INTERACTIVE_COMMENTS` allows comments starting with `#` in the shell.
  * `NO_CLOBBER` disallows `>` to overwrite existing files. Use `>|` or `>!` instead.

### Job control

  * `LONG_LIST_JOBS` lists jobs in verbose format by default.
  * `NO_BG_NICE` prevents background jobs being given a lower priority.
  * `NO_CHECK_JOBS` prevents status report of jobs on shell exit.
  * `NO_HUP` prevents SIGHUP to jobs on shell exit.
