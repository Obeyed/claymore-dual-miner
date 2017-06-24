Dockerized [Claymore's dual miner](https://github.com/nanopool/Claymore-Dual-Miner).

> **NOTE**: I do not recommend this miner.
> I experienced that the miner would go offline many times, and the calculated hash rate was much lower than expected.
> I would recommend [Anthony's miner](https://github.com/Anthony-Tatowicz/docker-ethminer) which was much more stable, and the hash rate was about double what this miner gives.

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
