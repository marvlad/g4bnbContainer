FROM almalinux:9

WORKDIR /root

RUN dnf -y update && \
    dnf -y install \
    vim \
    wget \
    git \
    bash-completion \
    net-tools \
    && dnf clean all

CMD ["/bin/bash"]
