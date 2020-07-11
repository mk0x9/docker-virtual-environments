FROM ubuntu:18.04
# identify as docker for systemd
ENV container docker
RUN mv /usr/sbin/policy-rc.d /usr/sbin/policy-rc.d.unused
RUN apt-get update && apt-get install -y apt-utils
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y systemd && rm -vf /lib/systemd/system/sysinit.target.wants/dev-*.mount
# additional deps to build image
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y sudo lsb-core software-properties-common git wget libunwind8
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y snapd fuse squashfuse && systemctl enable snapd
STOPSIGNAL SIGRTMIN+3
CMD [ "/sbin/init" ]
