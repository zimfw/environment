#
# Generic options and environment settings
#

# Use smart URL pasting and escaping.
autoload -Uz bracketed-paste-url-magic && zle -N bracketed-paste bracketed-paste-url-magic
autoload -Uz url-quote-magic && zle -N self-insert url-quote-magic

# The file to save the history in.
: ${HISTFILE="${ZDOTDIR:-${HOME}}/.zhistory"}

# The maximum number of events stored in the internal history list and in the history file.
HISTSIZE=10000
SAVEHIST=10000

# Remove path separtor from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}


#
# Changing directories
#

# If a command is issued that can’t be executed as a normal command, and the
# command is the name of a directory, perform the cd command to that directory.
setopt AUTO_CD

# Make cd push the old directory onto the directory stack.
setopt AUTO_PUSHD

# Don’t push multiple copies of the same directory onto the directory stack.
setopt PUSHD_IGNORE_DUPS

# Do not print the directory stack after pushd or popd.
setopt PUSHD_SILENT

# Have pushd with no arguments act like ‘pushd ${HOME}’.
setopt PUSHD_TO_HOME

#
# Expansion and globbing
#

# Treat the ‘#’, ‘~’ and ‘^’ characters as part of patterns for filename generation,
# etc. (An initial unquoted ‘~’ always produces named directory expansion.)
setopt EXTENDED_GLOB

#
# History
#

# Perform textual history expansion, csh-style, treating the character ‘!’ specially.
setopt BANG_HIST

# If a new command line being added to the history list duplicates an older one,
# the older command is removed from the list (even if it is not the previous event).
setopt HIST_IGNORE_ALL_DUPS

# Do not enter command lines into the history list if they are duplicates of the
# previous event.
setopt HIST_IGNORE_DUPS

# Remove command lines from the history list when the first character on the
# line is a space, or when one of the expanded aliases contains a leading space.
setopt HIST_IGNORE_SPACE

# When writing out the history file, older commands that duplicate newer ones are omitted.
setopt HIST_SAVE_NO_DUPS

# Whenever the user enters a line with history expansion, don't execute the line directly;
# instead, perform history expansion and reload the line into the editing buffer.
setopt HIST_VERIFY

# This option both imports new commands from the history file, and also causes your
# typed commands to be appended to the history file (like specifying INC_APPEND_HISTORY).
# The history lines are also output with timestamps ala EXTENDED_HISTORY.
setopt SHARE_HISTORY

#
# Input/output
#

# Allow comments starting with `#` even in interactive shells.
setopt INTERACTIVE_COMMENTS

# Disallow ‘>’ redirection to overwrite existing files.
# ‘>|’ or ‘>!’ must be used to overwrite a file.
setopt NO_CLOBBER

#
# Job control
#

# Treat single word simple commands without redirection as candidates for
# resumption of an existing job.
setopt AUTO_RESUME

# List jobs in the long format by default.
setopt LONG_LIST_JOBS

# Report the status of background jobs immediately, rather than waiting until
# just before printing a prompt.
setopt NOTIFY

# Prevent runing all background jobs at a lower priority.
setopt NO_BG_NICE

# Prevent reporting the status of background and suspended jobs before exiting a
# shell with job control. NO_CHECK_JOBS is best used only in combination with
# NO_HUP, else such jobs will be killed automatically.
setopt NO_CHECK_JOBS

# Prevent sending the HUP signal to running jobs when the shell exits.
setopt NO_HUP

#
# Scripts and functions
#

# Perform implicit tees or cats when multiple redirections are attempted.
setopt MULTIOS


# Set less or more as the default pager.
if (( ! ${+PAGER} )); then
  if (( ${+commands[less]} )); then
    export PAGER=less
  else
    export PAGER=more
  fi
fi

# sets the window title and updates upon directory change
# more work probably needs to be done here to support multiplexers
case ${TERM} in
  xterm*|*rxvt)
    termtitle_chpwd() {
      local ztermtitle
      if zstyle -s ':zim:environment' termtitle 'ztermtitle'; then
        print -Pn "\e]0;${ztermtitle}\a"
      fi
    }
    autoload -Uz add-zsh-hook && add-zsh-hook chpwd termtitle_chpwd
    termtitle_chpwd  # we execute it once to initialize the window title
    ;;
esac
