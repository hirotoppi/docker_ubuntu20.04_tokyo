FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NOWARNINGS yes

RUN apt-get update && apt-get install -y tzdata

ENV TZ = Azia/Tokyo

RUN apt-get update && apt-get install --yes --no-install-recommends nano
