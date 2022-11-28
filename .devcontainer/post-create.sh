sudo apt update && sudo apt-get upgrade
sudo apt install -y software-properties-common git curl pkg-config build-essential libssl-dev libffi-dev libgmp3-dev
sudo apt install -y python3 python3-dev python3-venv python3-pip

python3 -m venv ~/cairo_venv
source ~/cairo_venv/bin/activate
pip3 install ecdsa fastecdsa sympy cairo-lang

mkdir -p $HOME/cairo_libs
git clone github.com/OpenZeppelin/cairo-contracts.git $HOME/cairo_libs
ln -s $HOME/cairo_libs/cairo-contracts/src/openzeppelin $HOME/cairo_libs/openzeppelin
echo 'alias cairodev="python3 -m venv ~/cairo_venv; source ~/cairo_venv/bin/activate; export STARKNET_NETWORK=alpha-goerli; export CAIRO_PATH=~/cairo_libs; export STARKNET_WALLET=starkware.starknet.wallets.open_zeppelin.OpenZeppelinAccount"' >> ~/.bashrc
echo 'alias cairoprod="python3 -m venv ~/cairo_venv; source ~/cairo_venv/bin/activate; export STARKNET_NETWORK=alpha-mainnet; export CAIRO_PATH=~/cairo_libs; export STARKNET_WALLET=starkware.starknet.wallets.open_zeppelin.OpenZeppelinAccount"' >> ~/.bashrc
source ~/.bashrc

curl -L https://raw.githubusercontent.com/software-mansion/protostar/master/install.sh | bash
pip3 install starknet-devnet