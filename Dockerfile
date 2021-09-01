#ubuntu:20.04のimageをロード
FROM ubuntu:20.04

#ユーザーを作成
ARG DOCKER_UID=1000
ARG DOCKER_USER=developer
ARG DOCKER_PASSWARD=developer

#sudo権限付与

RUN useradd -m  -s /bin/bash -g root -G sudo -u ${DOCKER_UID}

#タイムゾーンのための設定
ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NOWARNINGS yes

RUN apt-get update && apt-get install -y tzdata

ENV TZ = Azia/Tokyo


#nanoとかとか
RUN apt-get update && apt-get install --yes --no-install-recommends nano && \
    apt-get install wget -y && \
    apt-get install sudo -y && \
    apt-get install curl -y

USER ${DOCCKER_USER}
WORKDIR /home/${DOCCKER_USER}