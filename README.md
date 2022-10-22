# Security Toolbox

This toolbox includes several updated tools for red team assessments and penetration testing running exclusively on docker

*Tools*

- amass
- anew
- Assetfinder
- DNS Recon
- dnsx
- Findomain
- gau
- hakrawler
- httprobe
- httpx
- pspy
- subfinder
- uncover
- waybackurls
- waymore
  
## Usage

```
echo "https://google.com"  | docker run -i securitybydesign/toolbox hakrawler -subs
```

For convenience you can export the commands directly in your zsh or bash profile and use as "local" commands

### ZSH alias

```
alias anew='docker run -i securitybydesign/toolbox anew'
alias assetfinder='docker run -i securitybydesign/toolbox assetfinder'
alias dnsrecon='docker run -i securitybydesign/toolbox dnsrecon'
alias dnsx='docker run -i securitybydesign/toolbox dnsx'
alias findomain='docker run -i securitybydesign/toolbox findomain'
alias gau='docker run -i securitybydesign/toolbox gau'
alias gowitness='docker run -i securitybydesign/toolbox gowitness'
alias hakrawler='docker run -i securitybydesign/toolbox hakrawler'
alias httprobe='docker run -i securitybydesign/toolbox httprobe'
alias httpx='docker run -i securitybydesign/toolbox httpx'
alias pspy64='docker run -i securitybydesign/toolbox pspy64'
alias subfinder='docker run -i securitybydesign/toolbox subfinder'
alias uncover='docker run -i securitybydesign/toolbox uncover'
alias waybackurls='docker run -i securitybydesign/toolbox waybackurls'
alias waymore='docker run -i securitybydesign/toolbox waymore'
```


## Build locally

```
docker build . -t toolbox:latest
```

# TODO

- Add more tools
- Evaluate if pspy64 make sense here or can be removed

# Tools on trial

- [syft](https://github.com/anchore/syft)
- [grype](https://github.com/anchore/grype)
- [checkov](https://github.com/bridgecrewio/checkov)
- [lynis](https://github.com/CISOfy/lynis)
- [DependencyCheck](https://github.com/jeremylong/DependencyCheck)
- [WhatWeb](https://github.com/urbanadventurer/WhatWeb)
- [kube-hunter](https://github.com/aquasecurity/kube-hunter)
- [kubeclarity](https://github.com/openclarity/kubeclarity)