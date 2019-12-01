# Setup fzf
# ---------
if [[ ! "$PATH" == */home/eisenulfr/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/eisenulfr/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/eisenulfr/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/eisenulfr/.fzf/shell/key-bindings.zsh"
