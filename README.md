environment
===========

Sets generic Zsh built-in environment options.

Also enables smart URL-pasting. This prevents the user from having to manually escape URLs.

Settings
--------

You can set a custom terminal title containing [prompt expansion escape sequences],
that is redrawn upon directory change. The example below sets the title to show
the current directory name:

    zstyle ':zim:environment' termtitle '%1~'

Zsh options
-----------

  * `AUTO_RESUME` resumes an existing job before creating a new one.
  * `INTERACTIVE_COMMENTS` allows comments starting with `#` in the shell.
  * `LONG_LIST_JOBS` lists jobs in verbose format by default.
  * `NOTIFY` reports job status immediately instead of waiting for the prompt.
  * `NO_BG_NICE` prevents background jobs being given a lower priority.
  * `NO_CHECK_JOBS` prevents status report of jobs on shell exit.
  * `NO_HUP` prevents SIGHUP to jobs on shell exit.

[prompt expansion escape sequences]: http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
