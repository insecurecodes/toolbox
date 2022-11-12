FROM alpine:latest

# Update packages
RUN apk update && apk upgrade --available && sync

# Install dependencies
RUN apk add go curl file git sudo wget python3 py3-pip linux-headers py3-psutil

## Set toolbox user
RUN adduser \
    --disabled-password \
    #  --ingroup "root" \
    "toolbox"
RUN chown -R toolbox: /usr/local/bin/

# Add python syslink for compatibility
RUN ln -s -f /usr/bin/python3 /usr/bin/python

# Tools
# hakrawler
RUN go install github.com/hakluke/hakrawler@latest && \
mv ~/go/bin/hakrawler /usr/local/bin/

# waybackurls
RUN go install github.com/tomnomnom/waybackurls@latest && \
mv ~/go/bin/waybackurls /usr/local/bin/

# gau
RUN go install github.com/lc/gau/v2/cmd/gau@latest && \
mv ~/go/bin/gau /usr/local/bin/

# anew
RUN go install -v github.com/tomnomnom/anew@latest && \
mv ~/go/bin/anew /usr/local/bin/

# Asset finder
RUN go install github.com/tomnomnom/assetfinder@latest && \
mv ~/go/bin/assetfinder /usr/local/bin/

# Amass
RUN go install -v github.com/OWASP/Amass/v3/...@master && \
mv ~/go/bin/amass /usr/local/bin/

# pspy
RUN wget `curl --silent "https://api.github.com/repos/DominicBreuker/pspy/releases/latest" |grep browser_download_url | grep -m 1 pspy64 |awk {'print $2'} |sed 's/\"//g'` -O /usr/local/bin/pspy64 && chmod +x /usr/local/bin/pspy64

# DNS Recon
RUN git clone https://github.com/darkoperator/dnsrecon.git ~/dnsrecon && \
cd ~/dnsrecon && pip3 install -r requirements.txt --no-warn-script-location && \
ln -s -f  $PWD/dnsrecon.py /usr/local/bin/dnsrecon

# Findomain
RUN wget https://github.com/findomain/findomain/releases/latest/download/findomain-linux.zip -O /usr/local/bin/findomain.zip && \
unzip  /usr/local/bin/findomain.zip -d usr/local/bin/ && \
chmod +x /usr/local/bin/findomain

# gowitness
RUN go install github.com/sensepost/gowitness@latest  && \
sudo mv ~/go/bin/gowitness /usr/local/bin/

# httprobe
RUN go install github.com/tomnomnom/httprobe@latest && \
sudo mv ~/go/bin/httprobe /usr/local/bin/

# httpx
RUN go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest && \
mv ~/go/bin/httpx /usr/local/bin/

# dnsx
RUN go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest && \
mv ~/go/bin/dnsx /usr/local/bin/

# subfinder
RUN go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest && \
mv ~/go/bin/subfinder /usr/local/bin/

# uncover
RUN go install -v github.com/projectdiscovery/uncover/cmd/uncover@latest && \
mv ~/go/bin/uncover /usr/local/bin/

# waymore
RUN git clone https://github.com/xnl-h4ck3r/waymore.git ~/waymore  && \
cd ~/waymore  && \
sudo python3 setup.py install  && \
sudo chmod +x ~/waymore/waymore.py  && \
sed -i -e 's/\r//g' waymore.py  && \
mv ~/waymore/waymore.py /usr/local/bin/waymore


# Katana
RUN go install -v github.com/projectdiscovery/katana/cmd/katana@latest && \
mv ~/go/bin/katana /usr/local/bin/


# # theHarvester
# RUN git clone https://github.com/laramies/theHarvester ~/theHarvester && \
# cd ~/theHarvester && \
# pip3 install -r requirements.txt




# # Z4nzu/hackingtool
# git clone https://github.com/Z4nzu/hackingtool.git ~/GIT-REPOS/CORE/hackingtool
# chmod -R 755 ~/GIT-REPOS/CORE/hackingtool && cd ~/GIT-REPOS/CORE/hackingtool
# sudo pip3 install -r requirement.txt
# bash install.sh

# Legion
# https://github.com/carlospolop/legion
