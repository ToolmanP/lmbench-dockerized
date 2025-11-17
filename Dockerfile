FROM toolmanp/ubuntu:22.04-zpoline

RUN apt update && apt upgrade -y
RUN apt install build-essential libtirpc-dev -y
RUN apt clean

WORKDIR /app
ADD . .
RUN make build CPPFLAGS="-I /usr/include/tirpc -Wno-implicit-int -Wno-implicit-function-declaration -Wno-return-mismatch -Wno-incompatible-pointer-types"
