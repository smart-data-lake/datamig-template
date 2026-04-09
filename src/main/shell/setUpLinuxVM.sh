sudo apt-get --yes update
sudo apt-get --yes upgrade
sudo apt-get --yes dist-upgrade
sudo apt-get --yes install apt-utils
sudo apt-get --yes install command-not-found
sudo apt-get --yes install default-jre-headless
sudo apt-get --yes install neovim
sudo apt-get --yes install nmon
sudo apt-get --yes install postgresql-client
sudo apt-get --yes install zsh
sudo apt-get --yes autoremove
sudo apt-get clean
sudo apt-get check
echo "===="
cat /etc/os-release
uname -a
echo "===="
hostname
whoami
free --human
df --human --type=ext4
