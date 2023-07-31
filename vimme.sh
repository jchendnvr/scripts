#!/bin/
# Author: Jesse Chenhalls
# Created Date: 20230731
# vimme.sh

# This will setup vimrc and its plugins. 

echo "Creating VIM Environment"
echo "copying .vimrc"
cp $HOME/scripts/vimrc $HOME/.vimrc
sleep 1

echo "downloading VIM plugins"
if [ ! -d "$HOME/.vim/pack/vendor/start" ]
then
	  mkdir -p $HOME/.vim/pack/vendor/start
fi

cd $HOME/.vim/pack/vendor/start/
git clone https://github.com/vim-airline/vim-airline.git airline
git clone https://github.com/vim-airline/vim-airline-themes.git airline-themes
git clone https://github.com/ap/vim-css-color.git css-color
git clone https://github.com/ctrlpvim/ctrlp.vim.git ctrlp
git clone https://github.com/ryanoasis/vim-devicons.git devicons
git clone https://github.com/junegunn/fzf.vim.git fzf
git clone https://github.com/preservim/nerdtree.git nerdtree
git clone https://github.com/mhinz/vim-startify.git startify
git clone https://github.com/jacoborus/tender.vim.git tender
git clone https://github.com/tpope/vim-commentary.git commentary

echo -e "\n\n"
sleep 1
echo "Downloading fzf plugin"
git clone https://github.com/junegunn/fzf.git $HOME/.fzf
$HOME/.fzf/install
sleep 1
echo "installing batcat aka bat for syntax highlighting"
sudo apt install bat -y
sleep 1
echo "binding fzf to f"

echo "
# alias fzf to f
alias f=\"fzf --preview='batcat --color=always --style=plain {}' --bind left:preview-page-up,right:preview-page-down\"
" >> $HOME/.bashrc

sleep 2
echo "Finished Creating VIM Environment"
