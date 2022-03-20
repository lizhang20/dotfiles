# Need to run `abbr --erase` to remove prev abbreviation
# Ref: https://fishshell.com/docs/current/cmds/abbr.html
# Such as: abbr -e s

abbr -a f ffmpeg
abbr -a mv "mv -v"

abbr -a pc proxychains
abbr -a tl tldr
abbr -a dig "dig +nostats +nocomments +nocmd"

# Kubernetes
#
abbr -a k kubectl
abbr -a kd "kubectl delete -f"
abbr -a ka "kubectl apply -f"

# Git
#
abbr -a gs "git status"
abbr -a ga "git add"
abbr -a gm "git commit -m"
abbr -a gp "git push"
abbr -a gap "git add -p"

# Unix timestamp
# Notice that postfix "%N" only works on Linux
abbr -a timestamp "date +%s%3N"

# Command-line history
#
abbr -a his "history | awk '{print \$1}' | sort | uniq -c | sort | tail -n10"

# VPN using openconnect
#
abbr -a vpn "sudo openconnect --protocol=gp vpn.bupt.edu.cn"

# Use 'exa' replace 'ls'
#
if command -v exa > /dev/null
    abbr -a l 'exa'
    abbr -a ls 'exa'
    # ll with newest-order
    abbr -a ll 'exa -l --sort=newest'
    abbr -a la 'exa -la'
    abbr -a tree 'exa --tree' # --level can be set by user
end


# If have diff-so-fancy installed and setup with git,
# use `git diff --no-index` replace diff in not git repository,
# else if have `colordiff`, use 'colordiff' replace 'diff'
#
if command -v diff-so-fancy > /dev/null
    abbr -a diff 'git diff --no-index'
else if command -v colordiff > /dev/null
    abbr -a diff 'colordiff'
end


# colored man output
# from http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
#
setenv LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
setenv LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
setenv LESS_TERMCAP_me \e'[0m'           # end mode
setenv LESS_TERMCAP_se \e'[0m'           # end standout-mode
setenv LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
setenv LESS_TERMCAP_ue \e'[0m'           # end underline
setenv LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline


function fish_greeting
    echo
    # Line below can work on macOS and Linux,
    # Output format is "Uptime: ** days ** hours ** minutes"
    echo -e (uptime | sed -E 's/.*up (.*days),.*([0-9]+):([0-9]+),.*/ \\\\e[1mUptime: \\\\e[0;32m\1 \2 hours \3 minutes/')
    echo		
end


# Below lines will change fish prompt format like 
# [date] LaptopName: Username | currentDir (git info) >>> ...
# Current configuration in functions/fish_prompt.fish
#
function fish_prompt
    # set_color brblack
    # echo -n "["(date "+%H:%M")"] "

    # Blue host name.
    # set_color blue
    # echo -n (hostname)" "

    # Show current directory
    set_color brblue 
    echo -n ' '(prompt_pwd)

    # Only show current folder name if not in $HOME
    #if [ $PWD != $HOME ]
        # set_color yellow
        # echo -n (basename $PWD)
    # end

    set_color brgreen
    printf '%s ' (__fish_git_prompt)
    set_color red
    # echo -n (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
    echo -n (set_color brgrey)'❯❯❯ '
    set_color normal
end


# using 'sdl' performs like `sudo !!` in bash
#
function sdl
    echo "sudo $history[1]"
    echo ""
    eval command sudo $history[1]
end

# using 'pl' performs `proxychains (last-command)`
#
function pl
    echo "proxychains $history[1]"
    echo ""
    eval command proxychains $history[1]
end


# import fish local config
#
if test -f ~/.fish.config.local
    source ~/.fish.config.local
end

