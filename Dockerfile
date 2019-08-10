FROM ubuntu:16.04 as builder

LABEL author="buzzkillb"

RUN apt-get update && apt-get install -y \
    git \
    make \
    build-essential \
    libboost-date-time-dev \
    libboost-filesystem-dev \
    libboost-program-options-dev \
    libboost-system-dev \
    libssl-dev \
    zlib1g-dev \
    libminiupnpc-dev \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/PurpleI2P/i2pd.git && \
    cd i2pd && \
    make

# final image
FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
    libboost-date-time-dev \
    libboost-filesystem-dev \
    libboost-program-options-dev \
    libboost-system-dev \
    libssl-dev \
    zlib1g-dev \
    libminiupnpc-dev \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /data

VOLUME ["/data"]

COPY --from=builder /i2pd/i2pd /usr/local/bin/

CMD /usr/local/bin/i2pd
