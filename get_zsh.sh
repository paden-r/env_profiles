echo "Installing zsh"
yum -y install zsh
zsh --version
chsh -s /bin/zsh
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "Getting settings"
mv .zshrc ../.zshrc
source ../.zshrc
echo "Installing Python 3"
yum install python3
echo "done!"
