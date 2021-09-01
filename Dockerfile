FROM alpine:edge

EXPOSE 22

RUN apk --no-cache add openssh shadow

RUN mkdir -p /etc/ssh/host_keys \
 && sed -i -e 's;#HostKey /etc/ssh;HostKey /etc/ssh/host_keys;' /etc/ssh/sshd_config \
 && sed -i -e 's;GatewayPorts.*no;GatewayPorts yes;' /etc/ssh/sshd_config \
 && sed -i -e 's;AllowTcpForwarding.*no;AllowTcpForwarding yes;' /etc/ssh/sshd_config \
 && sed -i -e 's;#MaxAuthTries.*;MaxAuthTries 30;' /etc/ssh/sshd_config
VOLUME ["/etc/ssh/host_keys"]

RUN useradd assistance \
 && mkdir -p /home/assistance \
 && chown assistance:root /home/assistance \
 && chmod 0755 /home/assistance

COPY entrypoint.sh /

CMD ["/entrypoint.sh"]
