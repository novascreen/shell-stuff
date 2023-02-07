ZSH_THEME="avit"

plugins=(git z)

export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=47;34:ow=1;34"
export DISPLAY=`grep -oP "(?<=nameserver ).+" /etc/resolv.conf`:0.0
export EDITOR="code --wait"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"

# https://github.com/Microsoft/WSL/issues/1838
# unsetopt BG_NICE

alias dc=docker-compose
alias g=git
alias pwsh=pwsh.exe
alias npmr="npm run"
alias npmc="npx npm-check"
alias npmcup="npx npm-check -u"
alias ys=yarn start
alias tf=terraform
alias tfp="terraform plan"
alias tfa="terraform apply"
alias p=pnpm
alias y=yarn

function gen-secret() {
  # Length with default
  length=${1:-32}
  openssl rand -base64 $length
}

function run() {
    number=$1
    shift
    for n in $(seq $number); do
      $@
    done
}

function run-break() {
    number=$1
    shift
    for n in $(seq $number); do
      echo "Run $n"
      $@
      if [ $? -eq 1 ]; then
          break
      fi
    done
}

