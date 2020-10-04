ARG SERVER_BUILD_IMAGE=ekidd/rust-musl-builder:latest
ARG WEB_BUILD_IMAGE=node:current-alpine

FROM ${SERVER_BUILD_IMAGE} as builder
ADD --chown=rust:rust server ./
RUN cargo install diesel_cli --no-default-features --features sqlite-bundled
RUN diesel migration run --database-url map.db
RUN cargo build --release

FROM ${WEB_BUILD_IMAGE} as web-builder
WORKDIR /home/node/src
ADD --chown=node:node web ./
RUN npm install
RUN npm audit fix
RUN npm run build

FROM alpine:latest
WORKDIR /root
COPY --from=builder \
    /home/rust/src/target/x86_64-unknown-linux-musl/release/server \
    /usr/local/bin/
COPY --from=web-builder \
    /home/node/src/build \
    /usr/local/share/www
COPY config ./
EXPOSE 80
CMD server
