FROM ghcr.io/swiftwasm/swift:5.9-jammy AS builder
WORKDIR /app.d
#COPY ./helo.swift ./
#RUN swiftc -target wasm32-unknown-wasi helo.swift -o helo.wasm
COPY ./Package.swift ./
COPY ./Sources/ ./Sources/
ARG ncpu=11
ARG typ=release
RUN swift \
    build \
    --configuration "${typ}" \
    --jobs "${ncpu}"

WORKDIR /app.d/Examples
COPY ./Examples/Package.swift ./
COPY ./Examples/Sources/      ./Sources/
RUN swift \
    build \
    --configuration "${typ}" \
    -Xlinker --stack-first \
    --triple wasm32-unknown-wasi \
    --jobs "${ncpu}"
RUN cp -i ./.build/release/UniqNameGenDbFriendlyExample.wasm /app.d/helo.wasm

FROM alpine:3.19.1 AS runner
RUN wget https://github.com/tetratelabs/wazero/releases/download/v1.6.0/wazero_1.6.0_linux_amd64.tar.gz
RUN wget https://github.com/tetratelabs/wazero/releases/download/v1.6.0/wazero_1.6.0_checksums.txt
RUN fgrep wazero_1.6.0_linux_amd64.tar.gz wazero_1.6.0_checksums.txt | sha256sum -c
RUN tar xvzf wazero_1.6.0_linux_amd64.tar.gz
RUN cp -ip wazero /usr/local/bin/wazero

FROM alpine:3.19.1
COPY --from=runner /usr/local/bin/wazero /wazero
COPY --from=builder /app.d/helo.wasm /helo.wasm

CMD ["/wazero", "run", "./helo.wasm"]
