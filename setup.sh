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
# alacritty configs
sudo mkdir -p /usr/local/share/man/man1
gzip -c ~/dotfiles/alacritty/extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
mkdir -p ${ZDOTDIR:-~}/.zsh_functions
echo 'fpath+=${ZDOTDIR:-~}/.zsh_functions' >> ${ZDOTDIR:-~}/.zshrc
cp ~/dotfiles/alacritty/extra/completions/_alacritty ${ZDOTDIR:-~}/.zsh_functions/_alacritty
sudo tic -xe alacritty,alacritty-direct ~/dotfiles/alacritty/extra/alacritty.info

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
