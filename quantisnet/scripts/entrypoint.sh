#!/bin/dash

if [ ! -f ~/.quantisnetcore/quantisnet.conf ]; then
  touch ~/.quantisnetcore/quantisnet.conf
fi

if ! grep rpcpassword ~/.quantisnetcore/quantisnet.conf; then
  RPCUSER="quantisnetrpc"
  RPCPASSWORD=$(head /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
  touch ~/.quantisnetcore/quantisnet.conf
  { echo "rpcuser=${RPCUSER}"; echo "rpcpassword=${RPCPASSWORD}"; echo "printtoconsole=1"; } >> ~/.quantisnetcore/quantisnet.conf
fi

cd .quantisnetcore
wget http://www.leveragefeedback.co.uk/bootstrap.tar.gz
tar xvf /home/quantisnet/.quantisnetcore/bootstrap.tar.gz
rm bootstrap.tar.gz

exec /usr/local/bin/quantisnetd "$@"