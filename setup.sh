ln -s -f ~/dotfiles/zshrc ~/.zshrc
ln -s -f ~/dotfiles/ctags ~/.ctags
git clone https://github.com/tmux-plugins/tmux-resurrect ~/tmux-resurrect
git clone https://github.com/tmux-plugins/tmux-continuum ~/tmux-continuum
brew cask install mpv
brew cask install xquartz
brew cask install mps-youtube
brew install reattach-to-user-namespace
brew install ctags
ln -s -f ~/dotfiles/tmux.conf ~/.tmux.conf
rm -rf ~/.vim/
ln -s -f ~/dotfiles/vimrc ~/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall
