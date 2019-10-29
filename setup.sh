ln -s -f ~/dotfiles/zshrc ~/.zshrc
git clone https://github.com/tmux-plugins/tmux-resurrect
git clone https://github.com/tmux-plugins/tmux-continuum
brew cask install mpv
brew cask install xquartz
brew cask install mps-youtube
ln -s -f ~/dotfiles/tmux.conf ~/.tmux.conf
rm -rf ~/.vim/
ln -s -f ~/dotfiles/vimrc ~/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall
