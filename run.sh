#!/bin/zsh

RUST_LOG=info configuration run --node-config example/node_1_cfg.toml -d example/db1 &

RUST_LOG=info configuration run --node-config example/node_2_cfg.toml -d example/db2 &

RUST_LOG=info configuration run --node-config example/node_3_cfg.toml -d example/db3 &
