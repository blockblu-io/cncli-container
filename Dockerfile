# Compiler Image
# ------------------------------------------------------------------------
FROM blockblu/ubuntu:20.04-rust AS compiler

ARG CNCLI_VERSION

# install dependencies
RUN apt-get update && \
	apt-get install -y --no-install-recommends \
        git \
 		libffi-dev \
		libgmp-dev \
		libssl-dev \
		libsystemd-dev \
		libtinfo-dev \
		zlib1g-dev && \
	rm -rf /var/lib/apt/lists/*

# compile the Rust code
WORKDIR /
RUN git clone --recurse-submodules https://github.com/AndrewWestberg/cncli.git cncli && \
	cd cncli && \
    git fetch --all --tags && \
    git checkout tags/v$CNCLI_VERSION --quiet && \
    mkdir -p /binaries && \
    cargo install --path . && \
    mv /root/.cargo/bin/cncli /binaries/

# Main Image
# -----------------------------------------------------------------------
FROM blockblu/ubuntu:20.04

RUN groupadd -r lovelace --gid 1402 && \
    useradd --no-log-init --uid 1402 -r -g lovelace lovelace

USER lovelace

# Documentation
LABEL maintainer="Kevin Haller <keivn.haller@blockblu.io>"
LABEL version="${CNCLI_VERSION}"
LABEL description="A community-based cardano-node CLI tool. It's a collection of utilities to enhance and extend beyond those available with the cardano-cli."

COPY --from=compiler /binaries/cncli /usr/local/bin/cncli

ENTRYPOINT [ "cncli" ]