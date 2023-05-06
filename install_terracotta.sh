if [[ $0 == *"-"* ]]; then
  if [ -z "$1" ]
  then
    echo "Please provide a environment name as argument \$1"
  else
    wget https://github.com//DHI-GRAS/terracotta/archive/refs/tags/v0.7.5.zip
    git clone https://github.com/DHI-GRAS/terracotta.git
    unzip v0.7.5.zip
    cp -r terracotta/.git terracotta-0.7.5/
    conda create -n $1 python=3.7 pip -y
    conda activate $1
    cd terracotta-0.7.5/
    pip install -e .
    pip install terracotta==0.7.5
    cd ..
    rm -rf terracotta terracotta-0.7.5/ v0.7.5.zip
  fi
else
    echo 'ERROR. Please execute the sciprt in the current process using command: . or Source. --> Example: . install_terracotta.sh <env_name> {OR} Source install_terracotta.sh <env_name>'
fi


