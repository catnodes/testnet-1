
### 1. update
```
sudo apt update && sudo apt upgrade -y
sudo apt install unzip
```

### 2. install depencies

```
sudo wget -qO /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/v4.23.1/yq_linux_amd64 && chmod +x /usr/local/bin/yq
sudo apt-get install jq -y
```

### 3. Installing Docker
```
sudo apt-get install ca-certificates curl gnupg lsb-release -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
```

### 4. Installing docker-compose
```
sudo wget -O /usr/bin/docker-compose "https://github.com/docker/compose/releases/download/${docker_compose_version}/docker-compose-`uname -s`-`uname -m`"
sudo chmod +x /usr/bin/docker-compose
```

### 5. Installing aptos CLI

```
wget -qO aptos-cli.zip https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v0.3.1/aptos-cli-0.3.1-Ubuntu-x86_64.zip
sudo unzip -o aptos-cli.zip -d /usr/local/bin
sudo chmod +x /usr/local/bin/aptos
rm aptos-cli.zip
aptos -V
```

### 6. create var
>change XXXX to your own username

```
export WORKSPACE=testnet
export USERNAME=XXXX
echo 'export USERNAME='$USERNAME >> $HOME/.bash_profile
echo "export WORKSPACE=testnet" >> $HOME/.bash_profile
source $HOME/.bash_profile
mkdir ~/$WORKSPACE
cd ~/$WORKSPACE
```

### 7. Download validator.yaml & docker-compose.yaml

```
wget https://raw.githubusercontent.com/aptos-labs/aptos-core/main/docker/compose/aptos-node/docker-compose.yaml
wget https://raw.githubusercontent.com/aptos-labs/aptos-core/main/docker/compose/aptos-node/validator.yaml
```


### 8. Import your keys + $USERNAME folder with SFTP to folder testnet




### 9. create layout.yaml
>dont change $USERNAME,cause you already create var

```
sudo tee layout.yaml > /dev/null <<EOF
---
root_key: "D04470F43AB6AEAA4EB616B72128881EEF77346F2075FFE68E14BA7DEBD8095E"
users: ["$USERNAME"]
chain_id: 43
allow_new_validators: false
epoch_duration_secs: 7200
is_test: true
min_stake: 100000000000000
min_voting_threshold: 100000000000000
max_stake: 100000000000000000
recurring_lockup_duration_secs: 86400
required_proposer_stake: 100000000000000
rewards_apy_percentage: 10
voting_duration_secs: 43200
voting_power_increase_limit: 20
EOF
```

### 10. Download the Aptos Framework
```
wget https://github.com/aptos-labs/aptos-core/releases/download/aptos-framework-v0.3.0/framework.mrb
```

### 11.  Compile genesis blob and waypoint 
```
aptos genesis generate-genesis --local-repository-dir ~/$WORKSPACE --output-dir ~/$WORKSPACE
```
### Start running

```
cd ~/testnet
sudo docker-compose up -d
```
