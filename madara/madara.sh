#!/bin/bash
clear
echo "=================================================="
echo -e "\033[0;35m"
echo " | |  | | | | |/ /  \/  |  / \  | \ | |  ";
echo " | |  | | | | ' /| |\/| | / _ \ |  \| |  ";
echo " | |__| |_| | . \| |  | |/ ___ \| |\  |  ";
echo " |_____\___/|_|\_\_|  |_/_/   \_\_| \_|  ";
echo -e "\e[0m"
echo "=================================================="  

echo -e "\e[1m\e[32m [1]. Updating paket... \e[0m" && sleep 1
sudo apt update && sudo apt upgrade -y
sudo apt install unzip
apt install git

echo -e "\e[1m\e[32m [1.1]. install depencies... \e[0m" && sleep 1
sudo apt install build-essential && sudo apt install pkg-config && sudo apt install libssl-dev && sudo apt install clang && sudo apt install protobuf-compiler -s -y

echo -e "\e[1m\e[32m [2]. install rust... \e[0m" && sleep 1
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"


echo -e "\e[1m\e[32m [3]. Checking if Docker is installed... \e[0m" && sleep 1
if ! command -v docker &> /dev/null
then
    echo -e "\e[1m\e[32m3.1 Installing Docker... \e[0m" && sleep 1
    sudo apt-get install ca-certificates curl gnupg lsb-release -y
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io -y
fi

echo -e "\e[1m\e[32m [3.1]. Checking dependencies... \e[0m" && sleep 1
if ! command  jq –version &> /dev/null
then
    echo -e "\e[1m\e[32m [2.1] Installing dependencies... \e[0m" && sleep 1
    # packages
    sudo wget -qO /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/v4.23.1/yq_linux_amd64 && chmod +x /usr/local/bin/yq
    sudo apt-get install jq -y
fi

echo -e "\e[1m\e[32m [4]. Checking if docker compose is installed ... \e[0m" && sleep 1
if ! command docker compose version &> /dev/null
then 
   docker_compose_version=$(wget -qO- https://api.github.com/repos/docker/compose/releases/latest | jq -r ".tag_name")
   sudo wget -O /usr/bin/docker-compose "https://github.com/docker/compose/releases/download/${docker_compose_version}/docker-compose-`uname -s`-`uname -m`"
   sudo chmod +x /usr/bin/docker-compose
fi

echo -e "\e[1m\e[32m [5]. Clone repo ... \e[0m" && sleep 1
git clone https://github.com/karnotxyz/madara-cli
