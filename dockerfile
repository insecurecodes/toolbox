# Use Ubuntu LTS as the base image
FROM debian:stable-slim

# Set environment variables to non-interactive (this prevents some prompts)
ENV DEBIAN_FRONTEND=non-interactive

# Install curl and other utilities, then install Go
RUN apt-get update && apt-get install -y curl && \
    LATEST_GO_VERSION=$(curl -s https://go.dev/dl/ | grep -oP 'go[0-9]+\.[0-9]+\.[0-9]+\.linux-amd64\.tar\.gz' | head -1) && \
    curl -O https://dl.google.com/go/$LATEST_GO_VERSION && \
    tar -C /usr/local -xzf $LATEST_GO_VERSION && \
    rm $LATEST_GO_VERSION

ENV PATH="/home/linuxbrew/.linuxbrew/bin:/usr/local/go/bin:${PATH}"

# set folder for default installation
RUN mkdir -p /opt/data
WORKDIR /opt/data

# Install any necessary dependencies
RUN apt-get install -y ca-certificates openssl python3 python3-pip curl git unzip tmux vim make wget

# Add python syslink for compatibility
RUN ln -s -f /usr/bin/python3 /usr/bin/python

# Install Brew
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && \
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /root/.profile && \
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Install Tools
## Amass
RUN go install -v github.com/owasp-amass/amass/v3/...@master

## Asset finder
RUN go install github.com/tomnomnom/assetfinder@latest

## anew
RUN go install -v github.com/tomnomnom/anew@latest

## Findomain
RUN curl -LO https://github.com/findomain/findomain/releases/latest/download/findomain-linux-i386.zip > /tmp/findomain-linux-i386.zip && \
curl -LO https://github.com/findomain/findomain/releases/latest/download/findomain-aarch64.zip > /tmp/findomain-aarch64.zip && \
curl -LO https://github.com/findomain/findomain/releases/latest/download/findomain-armv7.zip > /tmp/findomain-armv7.zip && \
unzip findomain-linux-i386.zip -d /tmp && chmod +x /tmp/findomain && mv /tmp/findomain /usr/bin/findomain-i386 && \
unzip findomain-aarch64.zip -d /tmp && chmod +x /tmp/findomain && mv /tmp/findomain /usr/bin/findomain-aarch64 && \
unzip findomain-armv7.zip -d /tmp && chmod +x /tmp/findomain && mv /tmp/findomain /usr/bin/findomain-armv7
# RUN wget https://github.com/findomain/findomain/releases/latest/download/findomain-linux.zip -O /usr/local/bin/findomain.zip && \
# unzip  /usr/local/bin/findomain.zip -d usr/local/bin/ && \
# chmod +x /usr/local/bin/findomain

## dnsx
RUN go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest

## subfinder
RUN go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

## gau
RUN go install github.com/lc/gau/v2/cmd/gau@latest

## goop
RUN go install github.com/deletescape/goop@latest

## httpx
RUN go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

## knock
RUN git clone https://github.com/guelfoweb/knock.git /opt/data/knock &&\
cd /opt/data/knock &&\
pip3 install  --break-system-packages -r requirements.txt && \
chmod +x knockpy.py && \
ln -s -f  $PWD/knockpy.py /usr/bin/knowckpy

## Photon
RUN git clone https://github.com/s0md3v/Photon.git /opt/data/Photon &&\
cd /opt/data/Photon &&\
pip3 install  --break-system-packages -r requirements.txt &&\
chmod +x photon.py &&\
ln -s -f  $PWD/photon.py /usr/bin/photon

## meg
RUN go install github.com/tomnomnom/meg@latest

## waybackurls
RUN go install github.com/tomnomnom/waybackurls@latest 

## Sudomy
RUN git clone --recursive https://github.com/screetsec/Sudomy.git /opt/data/sudomy &&\
cd /opt/data/sudomy &&\
pip3 install --break-system-packages -r requirements.txt &&\
chmod +x sudomy &&\
ln -s -f  $PWD/my /usr/bin/sudomy

## Uro
RUN pip3 install --break-system-packages uro

## Nuclei
RUN go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest

## Freq
RUN go install github.com/takshal/freq@latest

## sdlookup
RUN go install github.com/j3ssie/sdlookup@latest

## dnsvalidator
RUN git clone https://github.com/vortexau/dnsvalidator.git /opt/data/dnsvalidator &&\
cd /opt/data/dnsvalidator &&\
python3 setup.py install
#dnsvalidator -tL https://public-dns.info/nameservers.txt -threads 20 -o resolvers.txt

## massdns
RUN git clone https://github.com/blechschmidt/massdns.git /opt/data/massdns &&\
cd /opt/data/massdns &&\
make &&\
make install &&\
cd ~

# DNS Recon
RUN git clone https://github.com/darkoperator/dnsrecon.git /opt/data/dnsrecon && \
cd /opt/data/dnsrecon && pip3 install  --break-system-packages -r requirements.txt --no-warn-script-location && \
ln -s -f  $PWD/dnsrecon.py /usr/local/bin/dnsrecon

## PureDNS
RUN go install github.com/d3mondev/puredns/v2@latest

## hakrawler
RUN go install github.com/hakluke/hakrawler@latest

## httprobe
RUN go install github.com/tomnomnom/httprobe@latest

## gowitness
RUN go install github.com/sensepost/gowitness@latest

## uncover
RUN go install -v github.com/projectdiscovery/uncover/cmd/uncover@latest

## Katana
RUN go install -v github.com/projectdiscovery/katana/cmd/katana@latest

## hqurlscann3r
RUN go install -v github.com/hueristiq/hqurlscann3r/cmd/hqurlscann3r@latest

## xurlfind3r (old sigurlfind3r)
RUN go install -v github.com/hueristiq/xurlfind3r/cmd/xurlfind3r@latest

## Airixss
RUN go install github.com/ferreiraklet/airixss@latest

## trufflehog
RUN brew install trufflesecurity/trufflehog/trufflehog

## hakcheckurl
RUN go install github.com/hakluke/hakcheckurl@latest

## subjs
RUN go install github.com/lc/subjs@latest

## ParamSpider
RUN git clone https://github.com/devanshbatham/ParamSpider /opt/data/ParamSpider && \
cd /opt/data/ParamSpider && pip3 install --break-system-packages . && \
ln -s -f  $PWD/paramspider.py /usr/local/bin/paramspider

RUN git clone https://github.com/KathanP19/JSFScan.sh.git /opt/data/JSFScan && \
cd /opt/data/JSFScan && chmod +x *.sh && ./install.sh && \
ln -s -f  $PWD/JSFScan.sh /usr/local/bin/jsfscan

## Pacu
RUN pip3 install --break-system-packages pacu

## qsreplace
RUN go install github.com/tomnomnom/qsreplace@latest

## unfurl
RUN go install github.com/tomnomnom/unfurl@latest

## notify
RUN go install -v github.com/projectdiscovery/notify/cmd/notify@latest && \
mkdir -p $HOME/.config/notify
COPY ./config/provider-config.yaml /root/.config/notify/provider-config.yaml

LABEL maintainer="Renan Toesqui Magalhaes <rtm@insecure.codes>"

# workdir and volume
WORKDIR /root

# Start a long-running process as the container's command
CMD tail -f /dev/null

