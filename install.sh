if [ ! -d ~/.oh-my-zsh ]; then
	echo "Install oh my zsh ..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi 
echo "linking zsh path and alias ..."
ln -s $(readlink -f ./zsh/custom/path_alias.zsh) ~/.oh-my-zsh/

echo "Installing neovim ..."
# add check platform
sudo apt-get install neovim
sudo pacman -S neovim

echo "Install vimplug ..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "linking vim configuration"
ln -s $(readlink -f ./nvim/init.vim) ~/.config/nvim/

echo "Installing fzf ..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install



