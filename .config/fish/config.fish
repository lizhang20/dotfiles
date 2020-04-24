abbr -a s screenfetch
abbr -a pc proxychains
abbr -a gs "git status"
abbr -a ga "git add"
abbr -a gm "git commit"
abbr -a gp "git push"

# colored man output
# from http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
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
    set_color brblack
    echo -n "["(date "+%H:%M")"] "

    # Blue host name.
    # set_color blue
    # echo -n (hostname)" "

    # Show current directory
    set_color yellow
    echo -n (prompt_pwd)

    # Only show current folder name if not in $HOME
    # if [ $PWD != $HOME ]
        # set_color brblack
        # echo -n ':'
        # set_color yellow
        # echo -n (basename $PWD)
    # end

    set_color green
    printf '%s ' (__fish_git_prompt)
    set_color red
    echo -n (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
    set_color normal
end

if test -f ~/.fish.config.local
    source ~/.fish.config.local
end

# set terminal installed things with EN-lang
# https://stackoverflow.com/questions/14189134/how-to-change-git-from-chinese-to-english-in-mac
export LC_ALL=en_US.UTF-8
