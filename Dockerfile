#
# Bitcore with custom services and bitcore config
#

FROM node:4.2.6
MAINTAINER Lorien Gamaroff "lorien@gamaroff.org"

ENV project ~/centbee

RUN npm install -g bitcore

RUN useradd -r -m bitcore

RUN bitcore create ${project}

COPY bitcoin.conf ${project}/data/
COPY bitcored.service /lib/systemd/system/
COPY package.json ${project}/

WORKDIR ${project}

RUN npm install

CMD ["/usr/local/bin/bitcored"]
