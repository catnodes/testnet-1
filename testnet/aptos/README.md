# Aptos

![image](https://user-images.githubusercontent.com/48665887/185726831-3bdb42a3-3b6f-4a64-a9fd-3515f14ce7fb.png)



#### Tutorial Testnet Aptos dengan VPS by lukman (●'◡'●)

#### System Requirement

* 8vCPU
* 32GB RAM
* 16 Threads
* Ubuntu 20.04 LTS

#### Register community aptos

> https://aptoslabs.com/incentivized-testnet

#### Buat dan konek wallet

> link download https://github.com/aptos-labs/aptos-core/releases?q=wallet\&expanded=true

tutorial install wallet dengan video : https://youtu.be/-03D\_M7vMZ4

#### Install aptos validator

```
wget -qO aptos-bylukman.sh https://raw.githubusercontent.com/lukmanc405/testnet/main/aptos/aptos-bylukman.sh && chmod +x aptos-bylukman.sh && ./aptos-bylukman.sh
```

#### aktifkan port yang diperlukan

```
apt install ufw -y
ufw allow ssh
ufw allow https
ufw allow http
ufw allow 6180
ufw allow 80
ufw allow 9101
ufw allow 6181
ufw allow 6182
ufw allow 8080
ufw allow 9103
ufw enable
```

#### Cek kesehatan node

> https://ait.aptos-node.info/

![image](https://user-images.githubusercontent.com/48665887/185779319-805224db-5701-4451-bd27-3c119ea79cf2.png)

#### Cek aptos sync version

```
curl 127.0.0.1:9101/metrics 2> /dev/null | grep "aptos_state_sync_version{.*\"synced\"}"
curl 127.0.0.1:9101/metrics 2> /dev/null | grep "aptos_consensus_proposals_count"
curl 127.0.0.1:9101/metrics 2> /dev/null | grep "vote_nil_count"
```

#### Untuk cek log (Bila perlu)

```
docker logs testnet-validator-1 -f
```

#### Setelah penginstalan

isi data :

> https://aptoslabs.com/it3

NB : untuk bagian ini

kalian bisa dapatkan data ini di

```
cat ~/testnet/keys/public-keys.yaml
```

Atau bisa disini

```
source $HOME/.bash_profile
cat ~/testnet/$USERNAME/operator.yaml
```

![image](https://user-images.githubusercontent.com/48665887/185735804-5ca21c90-ea9f-4391-a287-87cd8e77ec72.png)

![image](https://user-images.githubusercontent.com/48665887/185727519-6c34f36c-a25e-4e17-830e-a7a3ffd7b5df.png)

Kalau sudah isi diatas tinggal `validate node`

jika sudah menyelesaikan semua task nanti akan seperti ini👇👇

![image](https://user-images.githubusercontent.com/48665887/185736047-725120ad-4e06-4f96-bd0d-5515268047b2.png)

#### cara uninstall aptos

```
cd $WORKSPACE && docker-compose down -v
cd $HOME && rm -rf {$WORKSPACE,aptos-bylukman.sh}
unset NODENAME
unset YOUR_IP
```
