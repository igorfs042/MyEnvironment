#!/bin/Bash

echo ==============================================
echo "# Atualizando repositórios"
echo ==============================================

if ! pacman -Syy --noconfirm
then
  echo "Não foi possível atualizar os repositórios."
  echo ----------------------------------------------
  exit 1
fi

echo ==============================================
echo "# Atualizando o sistema"
echo ==============================================

if ! pacman -Syuu --noconfirm
then
  echo "Não foi possível atualizar pacotes."
  echo ----------------------------------------------
  exit 1
fi

echo ==============================================
echo "# Instalando ferramentas"
echo ==============================================

pacman -S --noconfirm cmake

echo ""
echo "# Instalando o git"
echo ----------------------------------------------
if ! pacman -S git --noconfirm
then
  echo "Não foi possível instalar o git"
  echo ----------------------------------------------
  exit 1
fi

rm -f ~/.gitconfig
ln -s $(pwd)/dotfiles/.gitconfig ~/.gitconfig

echo ""
echo "# Instalando o python3"
echo ----------------------------------------------
if ! pacman -S python3 --noconfirm
then
  echo "Não foi possível instalar o python3"
  echo ----------------------------------------------
  exit 1
fi

echo ""
echo "# Instalando o docker"
echo ----------------------------------------------
if ! pacman -S docker --noconfirm
then
  echo "Não foi possível instalar o docker"
  echo ----------------------------------------------
  exit 1
fi

echo ""
echo "# Instalando o nodejs"
echo ----------------------------------------------
if ! pacman -S nodejs npm --noconfirm
then
  echo "Não foi possível instalar o nodejs"
  echo ----------------------------------------------
  exit 1
fi

npm install -g npm
npm install -g yarn

echo ""
echo "# Instalando o vim"
echo ----------------------------------------------
if ! pacman -S vim --noconfirm
then
  echo "Não foi possível instalar o vim"
  echo ----------------------------------------------
  exit 1
fi

rm -f ~/.vimrc
ln -s $(pwd)/dotfiles/.vimrc ~/.vimrc

echo ""
echo "# Instalando o zsh"
echo ----------------------------------------------
if ! pacman -S zsh --noconfirm
then
  echo "Não foi possível instalar o zsh"
  echo ----------------------------------------------
  exit 1
fi

sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s $(which zsh)

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all

rm -f ~/.zshrc

ln -s $(pwd)/dotfiles/.zshrc ~/.zshrc
