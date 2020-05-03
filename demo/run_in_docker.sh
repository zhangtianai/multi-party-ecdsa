#!/usr/bin/env bash

n=`cat params | sed -n 1p`
t=`cat params | sed -n 2p`
params="{\"parties\":\"$n\", \"threshold\":\"$t\"}"

echo "Params: $params"
echo -n $params > params.json
echo "$0: Multi-party ECDSA parties:$n threshold:$t"
sleep 1

/multi-party-ecdsa/sm_manager &

sleep 2
echo "keygen part"

for i in $(seq 1 $n)
do
    echo "key gen for client $i out of $n"
    /multi-party-ecdsa/gg18_keygen_client http://0.0.0.0:8001 keys$i.store &
    sleep 3
done



sleep 5
echo "sign"
while true;do echo wait signer;sleep 10;done
#for i in $(seq 1 $((t+1)));
#do
#    echo "signing for client $i out of $((t+1))"
#    /multi-party-ecdsa/gg18_sign_client http://0.0.0.0:8001 keys$i.store "KZen Networks" &
#    sleep 3
#done
