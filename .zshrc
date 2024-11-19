ZSH_THEME="avit"
ENABLE_CORRECTION="true"

plugins=(git z)

unsetopt correct_all

export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=47;34:ow=1;34"
# export DISPLAY=`grep -oP "(?<=nameserver ).+" /etc/resolv.conf`:0.0
export EDITOR="code --wait"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"

# # https://github.com/Microsoft/WSL/issues/1838
# # unsetopt BG_NICE

alias ducks='du -cksh $(ls -A) | sort -hr | head -n 15'
alias dc="docker compose"
alias g=git
alias gmt="git machete"
alias pwsh=pwsh.exe
alias npmr="npm run"
alias npmc="npx npm-check"
alias npmcup="npx npm-check -u"
alias ys=yarn start
alias tf=terraform
alias tfp="terraform plan"
alias tfa="terraform apply"
alias tfws="terraform workspace select"
alias p=pnpm
alias y=yarn
alias b=bun
alias br=bun run
alias bx=bunx
alias bb="bun --bun"
alias edit-hosts="code /etc/hosts"
alias flushdns="sudo killall -HUP mDNSResponder"
alias userPathsInCode="grep $USER | xargs code"

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

pn() {
  if [[ -f bun.lockb ]]; then
    command bun "$@"
  elif [[ -f pnpm-lock.yaml ]]; then
    command pnpm "$@"
  elif [[ -f yarn.lock ]]; then
    command yarn "$@"
  elif [[ -f package-lock.json ]]; then
    command npm "$@"
  else
    command pnpm "$@"
  fi
}

pni() {
  if [[ -f bun.lockb ]]; then
    command bun install "$@"
  elif [[ -f pnpm-lock.yaml ]]; then
    command pnpm install "$@"
  elif [[ -f yarn.lock ]]; then
    command yarn install "$@"
  elif [[ -f package-lock.json ]]; then
    command npm install "$@"
  else
    command pnpm install "$@"
  fi
}

pnx() {
  if [[ -f bun.lockb ]]; then
    command bunx "$@"
  elif [[ -f pnpm-lock.yaml ]]; then
    command pnpm dlx "$@"
  elif [[ -f yarn.lock ]]; then
    command yarn dlx "$@"
  elif [[ -f package-lock.json ]]; then
    command npx "$@"
  else
    command pnpm dlx "$@"
  fi
}
