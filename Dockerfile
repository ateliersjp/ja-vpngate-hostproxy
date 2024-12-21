FROM ateliersjp/hostproxy AS build

FROM alpine:3.14

COPY --from=build /bin/hostproxy /bin/

RUN apk add --no-cache \
    bash \
    openvpn \
    curl \
    coreutils \
    linux-tools \
    util-linux

COPY start.sh /bin/

ENTRYPOINT [ "start.sh" ]
