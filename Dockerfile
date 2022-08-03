# Build Stage
FROM ubuntu:20.04 as builder

## Install build dependencies
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y cmake clang curl git-all build-essential
RUN curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN ${HOME}/.cargo/bin/rustup default nightly
RUN ${HOME}/.cargo/bin/cargo install -f cargo-fuzz
ADD . /wasm-tools
WORKDIR /wasm-tools/fuzz/
RUN ${HOME}/.cargo/bin/cargo fuzz build
#package stage
FROM ubuntu:20.04
COPY --from=builder /wasm-tools/target/x86_64-unknown-linux-gnu/release/* /