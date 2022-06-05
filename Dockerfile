FROM dperson/openvpn-client

RUN apk update && \
    apk add --no-cache openssh

ARG UNAME=doca
ARG UID=1000
ARG GID=1000

RUN groupadd -g $GID $UNAME
RUN useradd -m -u $UID -g $GID $UNAME

WORKDIR /home/$UNAME

COPY vpn.* /vpn/

ENTRYPOINT ["/sbin/tini", "--", "/usr/bin/openvpn.sh"]
