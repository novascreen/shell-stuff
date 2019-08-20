ZSH_THEME="avit"

plugins=(git z)

export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=47;34:ow=1;34"

# https://github.com/Microsoft/WSL/issues/1838
unsetopt BG_NICE

alias dc=docker-compose
alias g=git
alias pwsh=pwsh.exe
alias npmr="npm run"
alias npmc="npx npm-check"
alias npmcup="npx npm-check -u"
