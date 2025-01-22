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

RUN git clone https://github.com/marvlad/g4bnbContainer.git && \
    cd g4bnbContainer && \
    source setup.sh

CMD ["/bin/bash"]
