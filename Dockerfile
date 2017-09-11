FROM library/ubuntu:trusty
MAINTAINER bob
USER root

RUN apt-get update
RUN apt-get -y install software-properties-common
RUN add-apt-repository ppa:ethereum/ethereum
RUN add-apt-repository ppa:ethereum/ethereum-dev
RUN apt-get update
RUN apt-get -y install ethereum solc 

RUN apt-get install -y python-pip python-dev libyaml-dev libssl-dev

RUN apt-get install -y pkg-config libffi-dev autoconf libtool
RUN pip install eth-testrpc
RUN ifconfig

EXPOSE 8545

CMD testrpc-py --host=0.0.0.0
