FROM nvidia/cuda:8.0-devel-ubuntu16.04

MAINTAINER "Elias Obeid <ekobeid@gmail.com>"

ENV MINER_VERSION 9.5
ENV RELEASE_TAR Claymore.s.Dual.Ethereum.Decred_Siacoin_Lbry_Pascal.AMD.NVIDIA.GPU.Miner.v${MINER_VERSION}.-.LINUX.tar.gz
ENV RELEASE_URI https://github.com/nanopool/Claymore-Dual-Miner/releases/download/v${MINER_VERSION}/$RELEASE_TAR

ENV GPU_FORCE_64BIT_PTR 0
ENV GPU_MAX_HEAP_SIZE 100
ENV GPU_USE_SYNC_OBJECTS 1
ENV GPU_MAX_ALLOC_PERCENT 100
ENV GPU_SINGLE_ALLOC_PERCENT 100

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      ca-certificates \
      build-essential \
      curl \
			libleveldb-dev \
			libjsoncpp-dev \
			libjsonrpccpp-dev \
			libboost-all-dev \
			libgmp-dev \
			libreadline-dev \
			libcurl4-gnutls-dev \
			ocl-icd-libopencl1 \
			opencl-headers \
			mesa-common-dev \
			libmicrohttpd-dev \
    && update-ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sLO $RELEASE_URI \
		&&  tar -xzf ./$RELEASE_TAR \
		&& rm -f ./$RELEASE_TAR

ENTRYPOINT ["./ethdcrminer64"]
CMD ["-epool eth-eu1.nanopool.org:9999", 
     "-ewal 0x57ea4a55789714126dc3f56e80551c797b88dc3e/1050Ti/ekobeid@gmail.com",
     "-epsw x",
     "-dpool stratum+tcp://sia-eu1.nanopool.org:7777",
     "-dwal 84317e097da34d64b15955caf2598926fe8ab202843300bd0ef8c9188b38730d77ab1b2b50e5/1050Ti/ekobeid@gmail.com",
     "-dcoin sia",
     "-dcri 120"]
