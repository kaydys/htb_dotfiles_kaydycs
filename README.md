# HTB Dotfiles Bootstrap

Instalación rápida para máquinas efímeras (HTB Academy Parrot CLI).

## Uso

1. Clona el repositorio en la instancia:

```bash
git clone https://github.com/kaydys/htb_dotfiles_kaydycs.git
cd htb-dotfiles
```

2. Si tienes sudo:

```bash
chmod +x bootstrap.sh
./bootstrap.sh
```

3. Si no tienes sudo:

```bash
chmod +x bootstrap-nosudo.sh
./bootstrap-nosudo.sh
export PATH=~/.local/bin:$PATH
zsh
```

## Push a GitHub

```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/kaydys/htb-dotfiles_kaydycs.git
git push -u origin main
```
