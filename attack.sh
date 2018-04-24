#!/bin/zsh

for i in {1..3}
do
    for j in {1..3}
    do
      # rand_1=$(( RANDOM % 10 ))
      # rand_2=$(( RANDOM % 10 ))
      rand_1=0
      rand_2=0
      request=$(printf '{
          "actual_from": 4000,
          "consensus": {
            "max_message_len": 1048576,
            "peers_timeout": 10000,
            "round_timeout": 5000,
            "status_timeout": 5000,
            "timeout_adjuster": {
              "min": 500,
              "max": 2000,
              "threshold": 5,
              "type": "Dynamic"
            },
            "txs_block_limit": 1000
          },
          "majority_count": null,
          "previous_cfg_hash": "3c7feb2de01ddd227cbb4517efa1f6942ab8ed04bd51e665130d736aee1560%s%s",
          "services": {
            "configuration": null
          },
          "validator_keys": [
            {
              "consensus_key": "026f0e12589b6e1405e12f2499994ae36dc17a62cb930ec352af304a81f3e289",
              "service_key": "25bef062f18c37c5b2fa220ffcb6b7fae3072dabe2e2f049495f81efa40a626c"
            },
            {
              "consensus_key": "65faa634a449482776deecce160faf090547474ec03c8fe6d1e44abfd4ec5109",
              "service_key": "425ebadc7579e4ec354c908dd158df26bbf6838ac6702e08a691560a45cce269"
            },
            {
              "consensus_key": "b9facbdd94d26a7a1a073e3dc472246519e933d1a7c7e68e93bd5c8f7b417713",
              "service_key": "65a5c945fe6c01fb3ef2b7db7856b2ae402cebbee0573111999dfbe35b99539f"
            }
          ]
       }' "$rand_1" "$rand_2")
      # echo $request
      curl -X POST -d $request http://127.0.0.1:809$j/api/services/configuration/v1/configs/postpropose
      sleep 0.5
    done
done
