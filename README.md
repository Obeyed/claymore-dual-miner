Dockerized [Claymore's dual miner](https://github.com/nanopool/Claymore-Dual-Miner).

Build it with:
```
nvidia-docker build -t claymore-miner -f Dockerfile .
```

Run it as:

```
nvidia-docker run --rm -it claymore-dual-miner \
  -epool eth-eu1.nanopool.org:9999 \
  -ewal <sia-account>/<worker-name>/<email> \
  -epsw x \
  -dpool stratum+tcp://sia-eu1.nanopool.org:7777 \
  -dwal <sia-account>/<worker-name>/<email> \
  -dcoin sia \
  -dcri 120
```

See their readme for more details.
