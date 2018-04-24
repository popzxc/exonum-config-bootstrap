Bunch of scripts for work with Exonum (written mostly for myself).

Pre-requirements: compiled configuration service. You can compile it as follows:
```
cd exonum/services/configuration
cargo install --example configuration
```

Usage:
```
./bootstrap.sh # It will generate config for 3 nodes
./run.sh # It will spawn all 3 nodes listening at ports specified in script
```

To shutdown nodes (I assume you don't run any another processes called `configuration` :) ):
```
killall configuration
```
