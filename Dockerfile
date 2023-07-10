# if you dont access use this 
# FROM vsomeip_build:v0 as builder
FROM registry.digitalocean.com/vehicle-plus/tcu_builder_packs:v8 as builder


COPY welcome.cpp welcome.cpp

RUN apk update && apk add --no-cache g++

RUN g++ -std=c++11 welcome.cpp -o welcome
FROM alpine:3.17.2
RUN apk add --no-cache mpg123 
COPY --from=builder /usr/lib/libstdc++.so.6 /usr/lib
COPY --from=builder /usr/lib/libgcc_s.so.1 /usr/lib
COPY --from=builder /welcome /welcome
COPY welcome.mp3 /welcome.mp3

ENTRYPOINT [ "/welcome" ]
# COPY vsomeip.json /etc/vsomeip/vsomeip.json
# ENV VSOMEIP_CONFIGURATION=/etc/vsomeip/vsomeip.json