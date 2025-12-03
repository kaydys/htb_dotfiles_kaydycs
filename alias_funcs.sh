alias l='ls -lah'
alias gs='git status'
alias gp='git pull'

nmapt(){ nmap -sC -sV -oA scan_$1 $1; }

fobo(){ feroxbuster -u $1 -w /usr/share/wordlists/dirb/common.txt -t 50; }

sshhtb(){ ssh -o "StrictHostKeyChecking=no" $1; }
