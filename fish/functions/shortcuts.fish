function rmdir
    rm -rf $argv
end

# Append common directories for executable files to $PATH
fish_add_path ~/.local/bin ~/.cargo/bin ~/Applications/depot_tools

## Useful aliases
# Replace ls with eza
alias ls='eza --color=always --group-directories-first --icons=always' # preferred listing
alias ll='eza -la --color=always --group-directories-first --icons=always'  # long format
alias la='eza -a --color=always --group-directories-first --icons=always'
alias ..='cd ..'
alias check-qtile='qtile check -c ~/.config/qtile/config.py'
