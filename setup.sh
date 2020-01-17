sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/tmux-plugins/tmux-resurrect ~/tmux-resurrect
git clone https://github.com/tmux-plugins/tmux-continuum ~/tmux-continuum
brew cask install mpv
brew cask install xquartz
brew cask install mps-youtube
brew install tmux
brew install reattach-to-user-namespace
brew install vim
brew install the_silver_searcher
rm -rf ~/.vim/
ln -s -f ~/dotfiles/vimrc ~/.vimrc
ln -s -f ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s -f ~/dotfiles/zshrc ~/.zshrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
