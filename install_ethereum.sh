#------------------------------------------
#  http://ethpool.org/
#------------------------------------------
sudo apt-get install -y software-properties-common
#sudo add-apt-repository -y ppa:ethereum/ethereum
#sudo sed 's/jessie/vivid/' -i /etc/apt/sources.list.d/ethereum-ethereum-*.list

# wget "ethminer" "https://github.com/ethereum-mining/ethminer/releases/download/v0.12.0/ethminer-0.12.0-Linux.tar.gz"

sudo add-apt-repository -y ppa:ethereum/ethereum-qt
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo add-apt-repository -y ppa:ethereum/ethereum-dev
sudo apt-get update
sudo apt-get install -y ethereum
sudo apt-get install -y cpp-ethereum
sudo apt-get install -y ethminer

#geth account new
#geth --rpc --rpccorsdomain localhost 2>> geth.log &
#ethminer -G  // -G for GPU, -M for benchmark
#tail -f geth.log

#sudo apt-get install -y linux-headers-amd64 build-essential
#ethminer -G -F http://us1.ethermine.org:14444/0x91F98b3309a4eE063370D0CA92900F6182a3Ab2d --farm-recheck 200

#geth --mine --minerthreads=4
#geth --etherbase 1 --mine  2>> geth.log // 1 is index: second account by creation order OR
#geth --etherbase '0x91F98b3309a4eE063370D0CA92900F6182a3Ab2d' --mine 2>> geth.log

#ethminer --farm-recheck 200 -G -S us1.ethermine.org:14444 -FS us1.ethermine.org:4444 -O 0x91F98b3309a4eE063370D0CA92900F6182a3Ab2d.server1

echo "\r\n Done \r\n \r\n"
