#!/bin/zsh

rm -rf example

mkdir example

configuration generate-template example/common.toml --validators-count 3

configuration generate-config example/common.toml example/pub_1.toml example/sec_1.toml --peer-address 127.0.0.1:6331

configuration generate-config example/common.toml example/pub_2.toml example/sec_2.toml --peer-address 127.0.0.1:6332

configuration generate-config example/common.toml example/pub_3.toml example/sec_3.toml --peer-address 127.0.0.1:6333

configuration finalize --public-api-address 0.0.0.0:8081 --private-api-address 0.0.0.0:8091 example/sec_1.toml example/node_1_cfg.toml --public-configs example/pub_1.toml example/pub_2.toml example/pub_3.toml

configuration finalize --public-api-address 0.0.0.0:8082 --private-api-address 0.0.0.0:8092 example/sec_2.toml example/node_2_cfg.toml --public-configs example/pub_1.toml example/pub_2.toml example/pub_3.toml

configuration finalize --public-api-address 0.0.0.0:8083 --private-api-address 0.0.0.0:8093 example/sec_3.toml example/node_3_cfg.toml --public-configs example/pub_1.toml example/pub_2.toml example/pub_3.toml
