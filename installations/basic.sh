# Installation script for an Ubuntu setup with:
#  + Kitty and ZSH with Oh-My-Zsh
#  + PipeWire with PipeWire-Jack
#  + Latest compiled SuperCollider and NeoVim with SCNVim
#  + SSH with tmux and rsync
#
# Should run in less than 30 minutes without user interaction.
# Assumes fresh Ubuntu 23.04 basic install.
# Clones utruscripts repo for any further installation/config needs.
# Can be gotten with "wget tinyurl.com/utrumque-install"
#
# Options:
#   -r for remote install (no Qt or IDE for SC)

set +x

remote=false
while getopts 'r' OPTION; do
    case "$OPTION" in
        r)
            remote=true
            ;;
    esac
done

# UPDATE
sudo apt update && sudo apt upgrade -y
sudo apt install fonts-ibm-plex git kitty curl qpwgraph ripgrep -y

## ZSH WITH OH MY ZSH
sudo apt install zsh -y
sudo chsh -s /bin/zsh $USER
cd /tmp
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
rm -rf ~/.oh-my-zsh
sh install.sh --unattended

# SSH
sudo apt install ssh tmux rsync nmap -y
sudo systemctl restart ssh.service

# PIPEWIRE JACK
sudo apt install pipewire-jack qpwgraph -y
sudo cp /usr/share/doc/pipewire/examples/ld.so.conf.d/pipewire-jack-x86_64-linux-gnu.conf /etc/ld.so.conf.d/
sudo ldconfig

# SOURCE DIRECTORY
cd ~
if [ ! -d "src" ]; then
    mkdir src
fi

# NEOVIM
cd ~/src
if [ -d "~/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
    cd ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    git pull
else
    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi
sudo apt install ninja-build gettext cmake unzip curl -y
if [ -d "neovim" ]; then
    cd neovim
    git pull
else
    git clone https://github.com/neovim/neovim
    cd neovim
fi
make -j3 CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

# SUPERCOLLIDER
cd ~/src
sudo apt install build-essential cmake libjack-jackd2-dev libsndfile1-dev libfftw3-dev libxt-dev libavahi-client-dev -y
sudo apt install libudev-dev qtbase5-dev qt5-qmake qttools5-dev qttools5-dev-tools qtdeclarative5-dev libqt5svg5-dev libqt5websockets5-dev qtwebengine5-dev -y
if [ -d "SuperCollider" ]; then
    cd SuperCollider
    git pull
else
    git clone --recurse-submodules https://github.com/SuperCollider/SuperCollider.git
    cd SuperCollider
fi
mkdir build
cd build
if [ "$remote" = true ]
then
    cmake -DCMAKE_BUILD_TYPE=Release -DNATIVE=ON -DSC_EL=OFF -DSC_QT=OFF -DSUPERNOVA=OFF ..
else
    cmake -DCMAKE_BUILD_TYPE=Release -DNATIVE=ON -DSC_EL=OFF ..
fi
make -j3
sudo make install

# UTUSCRIPTS
cd ~/src
if [ -d "utruscripts" ]; then
    cd utruscripts
    git pull
else
    git clone https://github.com/utrumque-public/utruscripts
fi

# DOTFILES (change dotfiles repo depending on -l or -g flag)
cd ~/src
if [ -d "dotfiles" ]; then
    cd dotfiles
    git pull
else
    git clone https://github.com/elblaus/dotfiles
    cd dotfiles
fi
sh ./install.sh -g
nvim --headless -c "PackerInstall" -c "autocmd User PackerComplete quitall"

# AUDIO TUNING
sudo usermod -a -G audio $USER
sudo usermod -a -G dialout $USER

if ! grep -q "rtprio 95" /etc/security/limits.conf
then
    echo "
    @audio - memlock unlimited
    @audio - rtprio 95
    " | sudo tee -a /etc/security/limits.conf
fi

sudo apt install rtirq-init -y
sudo sed -i 's/quiet splash"/quiet splash threadirqs"/g' /etc/default/grub
sudo update-grub

if ! grep -q "rtprio 95" /etc/security/limits.d/audio.conf
then
    sudo echo "
    @audio - memlock unlimited
    @audio - rtprio 95
    " | sudo tee /etc/security/limits.d/audio.conf
fi

# CLEAN UP
sudo apt autoremove -y
