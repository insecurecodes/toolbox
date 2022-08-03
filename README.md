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
- httpx
- pspy
- subfinder
- uncover
- waybackurls
## Usage

```
cat 1.txt  | docker run -i toolbox hakrawler -subs
```

## Installation

```
docker build . -t toolbox:latest
```

# TODO

- List of alias on zsh and shell
- Add more tools
