function frg --description "rg tui built with fzf and bat"
  export EDITOR="vim"
  rg --ignore-case --color=always --line-number --no-heading "$argv" |
          fzf --ansi \
              --color 'hl:-1:underline,hl+:-1:underline:reverse' \
              --delimiter ':' \
              --preview "bat --color=always {1} --theme='Solarized (light)' --highlight-line {2}" \
              --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
              --bind "enter:execute($EDITOR +{2} {1})"
end
