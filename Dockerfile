FROM ubuntu:latest

MAINTAINER Alvas <mo@mo.com>
LABEL description="Googoo Gaga"


# Update Ubuntu.
RUN apt-get update
RUN apt-get install -y apt-utils debconf-utils
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update && apt-get -y upgrade

RUN apt-get install -y python3-pip  python3
RUN apt-get install -y libmecab-dev mecab mecab-ipadic-utf8
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8   

RUN apt-get install -y locales
RUN pip3 install mecab-python3
RUN pip3 install jaconv
RUN pip3 install romkan

COPY speak.py /
