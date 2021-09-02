#ubuntu:20.04のimageをロード
FROM ubuntu:20.04

EXPOSE 8888

#ユーザーを作成
#ARG DOCKER_UID=1000
#ARG DOCKER_USER=developer
#ARG DOCKER_PASSWARD=developer


#sudo権限付与
#RUN useradd -m  -s /bin/bash -g root -G sudo -u ${DOCKER_UID}

#pathの設定
ENV PATH /opt/conda/bin:$PATH

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

#Anaconda3のインストール
ENV Anaconda3_URL https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh
    
RUN wget ${Anaconda3_URL} -O anaconda.sh -q && \ 
    /bin/bash anaconda.sh -b -p /opt/conda && \
    rm anaconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc && \
    find /opt/conda/ -follow -type f -name '*.a' -delete && \
    find /opt/conda/ -follow -type f -name '*.js.map' -delete && \
    /opt/conda/bin/conda clean -afy

#CMD [ "/bin/bash" ]

WORKDIR /root/conda_ws
CMD /bin/bash


#USER ${DOCKER_USER}
#WORKDIR /home/${DOCKER_USER}

##########################
###------memo----------###
##########################

# RUN wgwt~のところでanacinda.shがbin/bashに入るから、次に/bin/bashでanaconda.sh