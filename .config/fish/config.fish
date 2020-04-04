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
	echo -e (uname -ro | awk '{print " \\\\e[1mOS: \\\\e[0;32m"$0"\\\\e[0m"}')
	echo -e (uptime -p | sed 's/^up //' | awk '{print " \\\\e[1mUptime: \\\\e[0;32m"$0"\\\\e[0m"}')
	echo -e (uname -n | awk '{print " \\\\e[1mHostname: \\\\e[0;32m"$0"\\\\e[0m"}')
        echo		
end

# Below lines will change fish prompt format like 
# [date] LaptopName: Username | currentDir (git info) >>> ...
# Current configuration in functions/fish_prompt.fish
#
# function fish_prompt
#     set_color brblack
#     echo -n "["(date "+%H:%M")"] "
#     set_color blue
#     echo -n (hostname)
#     if [ $PWD != $HOME ]
#         set_color brblack
#         echo -n ':'
#         set_color yellow
#         echo -n (basename $PWD)
#     end
#     set_color green
#     printf '%s ' (__fish_git_prompt)
#     set_color red
#     echo -n '| '
#     set_color normal
# end
