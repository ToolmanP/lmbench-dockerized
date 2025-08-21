FROM alpine:latest AS builder

RUN apk update && apk upgrade && apk add --no-cache build-base bash perl libtirpc-dev

WORKDIR /app
ADD . .
RUN make build CPPFLAGS="-I /usr/include/tirpc -Wno-implicit-int -Wno-implicit-function-declaration -Wno-return-mismatch -Wno-incompatible-pointer-types -fPIE"
ENTRYPOINT ["make", "results"]
