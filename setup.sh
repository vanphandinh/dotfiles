sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/tmux-plugins/tmux-resurrect ~/tmux-resurrect
git clone https://github.com/tmux-plugins/tmux-continuum ~/tmux-continuum
brew cask install mpv xquartz mps-youtube alacritty
brew install tmux vim ripgrep reattach-to-user-namespace
rm -rf ~/.vim/
ln -s -f ~/dotfiles/vimrc ~/.vimrc
ln -s -f ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s -f ~/dotfiles/zshrc ~/.zshrc
ln -s -f ~/dotfiles/alacritty.yml ~/.alacritty.yml
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
