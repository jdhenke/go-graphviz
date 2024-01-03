FROM ghcr.io/webassembly/wasi-sdk:latest

RUN apt-get update && apt install -y pkg-config libexpat1-dev

COPY graphviz-9.0.0 /graphviz
COPY expat /expat

WORKDIR /work

RUN cd /graphviz && ./configure --host=amd64 --enable-ltdl=no --with-ipsepcola=no

COPY Makefile .
COPY bind.c .

RUN make build
