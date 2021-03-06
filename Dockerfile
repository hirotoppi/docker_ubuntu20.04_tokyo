#ubuntu:20.04のimageをロード
FROM ubuntu:20.04

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