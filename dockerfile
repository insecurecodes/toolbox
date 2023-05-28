# Use Ubuntu LTS as the base image
FROM opensuse/tumbleweed:latest

# Update the package lists
RUN zypper dup -y

##ENV
ENV PATH="/home/linuxbrew/.linuxbrew/bin:/root/go/bin:${PATH}"

# set folder for default installation
RUN mkdir -p /opt/data
WORKDIR /opt/data

# Install any necessary dependencies
RUN zypper install -y ca-certificates openssl python3 python3-pip curl sudo git go unzip tmux vim make wget

# Add python syslink for compatibility
RUN ln -s -f /usr/bin/python3 /usr/bin/python

# Install Brew
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" &&\
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /root/.profile &&\
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
pip3 install -r requirements.txt &&\
chmod +x knockpy.py &&\
ln -s -f  $PWD/knockpy.py /usr/bin/knowckpy

## Photon
RUN git clone https://github.com/s0md3v/Photon.git /opt/data/Photon &&\
cd /opt/data/Photon &&\
pip3 install -r requirements.txt &&\
chmod +x photon.py &&\
ln -s -f  $PWD/photon.py /usr/bin/photon

## meg
RUN go install github.com/tomnomnom/meg@latest

## waybackurls
RUN go install github.com/tomnomnom/waybackurls@latest 

## Sudomy
RUN git clone --recursive https://github.com/screetsec/Sudomy.git /opt/data/Sudomy &&\
cd /opt/data/Sudomy &&\
pip3 install -r requirements.txt &&\
chmod +x sudomy &&\
ln -s -f  $PWD/sudomy /usr/bin/sudomy

## Uro
RUN pip3 install uro

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
cd /opt/data/dnsrecon && pip3 install -r requirements.txt --no-warn-script-location && \
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
cd /opt/data/ParamSpider && pip3 install -r requirements.txt && \
ln -s -f  $PWD/paramspider.py /usr/local/bin/paramspider

## Pacu
RUN pip3 install pacu

## qsreplace
RUN go install github.com/tomnomnom/qsreplace@latest

## notify
RUN go install -v github.com/projectdiscovery/notify/cmd/notify@latest

LABEL maintainer="Renan Toesqui Magalhaes <renan@rtm.codes>"

# workdir and volume
WORKDIR /root

# Start a long-running process as the container's command
CMD tail -f /dev/null

