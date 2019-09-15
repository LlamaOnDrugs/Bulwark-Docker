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

wget https://blockbook.quantisnetwork.org/static/templates/bootstrap.tar.gz
tar xvf bootstrap.tar.gz ~/.quantisnetcore
rm bootstrap.tar.gz

exec /usr/local/bin/quantisnetd "$@"