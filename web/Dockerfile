# Base image
FROM ubuntu:22.04

# Labels and Credits
LABEL \
    name="ajta" \
    author="disciple" \
    description="ajta is a automated pipeline of recon process, useful for information gathering during web application penetration testing."

# Environment Variables
ENV DEBIAN_FRONTEND="noninteractive" \
    DATABASE="postgres"
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV GOROOT="/usr/local/go"
ENV GOPATH=$HOME/go
ENV PATH="${PATH}:${GOROOT}/bin:${GOPATH}/bin"

# Install Python
RUN apt update -y && \
    apt update -y && \
    apt install -y \
    python3.10 \
    python3-dev \
    python3-pip

# Install essential packages
RUN apt install -y  --no-install-recommends \
    build-essential \
    cmake \
    geoip-bin \
    geoip-database \
    gcc \
    git \
    libpq-dev \
    libpango-1.0-0 \
    libpangoft2-1.0-0 \
    libpcap-dev \
    netcat \
    nmap \
    x11-utils \
    xvfb \
    wget \
    curl \
    python3-netaddr \
    software-properties-common

RUN add-apt-repository ppa:mozillateam/ppa

# Download and install go 1.20
RUN wget -O go1.20.linux-amd64.tar.gz  https://cdna.p30download.ir/p30dl-software/Go.v1.19.5.Linux.x64_p30download.com.tar.gz
RUN tar -xvf go1.20.linux-amd64.tar.gz
RUN rm go1.20.linux-amd64.tar.gz
RUN mv go /usr/local
# Download geckodriver
RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.32.0/geckodriver-v0.32.0-linux64.tar.gz
RUN tar -xvf geckodriver-v0.32.0-linux64.tar.gz
RUN rm geckodriver-v0.32.0-linux64.tar.gz
RUN mv geckodriver /usr/bin

# Make directory for app
WORKDIR /usr/src/app

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Download Go packages
RUN go install -v -v github.com/bp0lr/gauplus@latest
RUN go install -v github.com/jaeles-project/gospider@latest
RUN go install -v github.com/tomnomnom/gf@latest
RUN go install -v github.com/tomnomnom/unfurl@latest
RUN go install -v github.com/tomnomnom/waybackurls@latest
RUN go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
RUN go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
RUN go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
RUN go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
RUN go install -v github.com/hakluke/hakrawler@latest
<<<<<<< HEAD
RUN go install -v github.com/lc/gau/v2/cmd/gau@latest
RUN go install -v github.com/jaeles-project/gospider@latest
RUN go install -v github.com/owasp-amass/amass/v3/...@latest
RUN go install -v github.com/ffuf/ffuf@latest
RUN go install -v github.com/projectdiscovery/tlsx/cmd/tlsx@latest
RUN go install -v github.com/hahwul/dalfox/v2@latest
RUN go install -v github.com/projectdiscovery/katana/cmd/katana@latest
RUN go install -v github.com/dwisiswant0/crlfuzz/cmd/crlfuzz@latest
RUN go install -v github.com/sa7mon/s3scanner@latest
=======

RUN GO111MODULE=on go install -v -v github.com/bp0lr/gauplus@latest

RUN GO111MODULE=on go install -v github.com/jaeles-project/gospider@latest

RUN apt install unzip -y
RUN wget https://github.com/owasp-amass/amass/releases/download/v3.23.2/amass_Linux_amd64.zip
RUN unzip  amass_Linux_amd64.zip
RUN mv amass_Linux_amd64/amass /usr/local/go/bin
RUN rm -rf amass*

RUN go install -v github.com/ffuf/ffuf@latest

RUN go install -v github.com/tomnomnom/assetfinder@latest
RUN GO111MODULE=on go install -v github.com/tomnomnom/gf@latest
RUN GO111MODULE=on go install -v github.com/tomnomnom/unfurl@latest
RUN GO111MODULE=on go install -v github.com/tomnomnom/waybackurls@latest


#RUN GO111MODULE=on go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
RUN wget https://github.com/projectdiscovery/httpx/releases/download/v1.3.1/httpx_1.3.1_linux_amd64.zip
RUN unzip httpx_1.3.1_linux_amd64.zip
RUN mv httpx /usr/local/go/bin
RUN rm -rf httpx*



#RUN GO111MODULE=on go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
RUN wget https://github.com/projectdiscovery/subfinder/releases/download/v2.5.8/subfinder_2.5.8_linux_amd64.zip
RUN unzip subfinder_2.5.8_linux_amd64.zip
RUN mv subfinder /usr/local/go/bin
RUN rm -rf subfinder*


#RUN GO111MODULE=on go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
RUN wget https://github.com/projectdiscovery/nuclei/releases/download/v2.9.4/nuclei_2.9.4_linux_amd64.zip
RUN unzip nuclei_2.9.4_linux_amd64.zip
RUN mv nuclei /usr/local/go/bin
RUN rm -rf nuclei*



#RUN GO111MODULE=on go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
RUN wget https://github.com/projectdiscovery/naabu/releases/download/v2.1.6/naabu_2.1.6_linux_amd64.zip
RUN unzip naabu_2.1.6_linux_amd64.zip
RUN mv naabu /usr/local/go/bin
RUN rm -rf naabu*
>>>>>>> d8e08d12274f9a1fe180c695d7e3eb1a06e38fa5

# Update Nuclei and Nuclei-Templates
RUN nuclei -update
RUN nuclei -update-templates

# Copy requirements
COPY ./requirements.txt /tmp/requirements.txt
RUN pip3 install --upgrade setuptools pip && \
    pip3 install -r /tmp/requirements.txt


# install eyewitness

RUN python3 -m pip install fuzzywuzzy \
    selenium==4.9.1 \
    python-Levenshtein \
    pyvirtualdisplay \
    netaddr

# Copy source code
COPY . /usr/src/app/

# httpx seems to have issue, use alias instead!!!
RUN echo 'alias httpx="/go/bin/httpx"' >> ~/.bashrc
