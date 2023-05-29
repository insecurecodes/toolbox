- [Security Toolbox](#security-toolbox)
  - [Usage](#usage)
  - [Build locally](#build-locally)
- [Utils](#utils)
- [TODO](#todo)
- [Tools on trial](#tools-on-trial)


# Security Toolbox

This toolbox includes several updated tools for red team assessments and bug bounty running exclusively on docker

*Tools*

| Pkg                                                         | Info                                                                                                                                                              |
| ----------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Airixss](https://github.com/ferreiraklet/airixss)          | Find possible xss vulnerable endpoints.                                                                                                                           |
| [Amass](https://github.com/owasp-amass/amass)               | Recon - Network mapping of attack surfaces and external asset discovery.                                                                                          |
| [AssetFinder](https://github.com/tomnomnom/assetfinder)     | Find domains and subdomains potentially related to a given domain.                                                                                                |
| [DNSRecon](https://github.com/darkoperator/dnsrecon)        | Check all NS Records  /  Enumerate / Brute Force  / PTR.                                                                                                          |
| [Findomain](https://github.com/Findomain/Findomain)         | Directory fuzzing/ports scan/vulnerabilities discovery (with Nuclei) - and more.                                                                                  |
| [Freq](https://github.com/takshal/freq)                     | CLI tool for send fast Multiple get HTTP request.                                                                                                                 |
| [Katana](https://github.com/projectdiscovery/katana)        | A next-generation crawling and spidering framework.                                                                                                               |
| [Knock](https://github.com/guelfoweb/knock)                 | Knockpy is a portable and modular python3 tool designed to quickly enumerate subdomains on a target domain through passive reconnaissance and dictionary scan.    |
| [Meg](https://github.com/tomnomnom/meg)                     | Fetch URL  - Many paths for many hosts; fetching one path for all hosts before moving on to the next path and repeating.                                          |
| [Nuclei](https://github.com/projectdiscovery/nuclei/)       | Fast and customisable vulnerability scanner based on simple YAML based DSL.                                                                                       |
| [Pacu](https://github.com/RhinoSecurityLabs/pacu)           | AWS exploitation framework.                                                                                                                                       |
| [ParamSpider](https://github.com/devanshbatham/ParamSpider) | Finds parameters from web archives of the entered (sub)domain.                                                                                                    |
| [Photon](https://github.com/s0md3v/Photon)                  | Frawler designed for OSINT.                                                                                                                                       |
| [PureDNS](https://github.com/d3mondev/puredns/)             | Fast domain resolver and subdomain bruteforcing tool that can accurately filter out wildcard subdomains and DNS poisoned entries.                                 |
| [Sudomy](https://github.com/screetsec/Sudomy)               | Subdomain Enumeration & Analysis                                                                                                                                  |
| [Uncover](https://github.com/projectdiscovery/uncover)      | Quickly discover exposed hosts on the internet using multiple search engines.                                                                                     |
| [Uro](https://github.com/s0md3v/uro)                        | URL list for security testing can be painful as there are a lot of URLs that have uninteresting/duplicate content                                                 |
| [Waybackurls](https://github.com/tomnomnom/waybackurls)     | Accept line-delimited domains on stdin, fetch known URLs from the Wayback Machine for *.domain and output them on stdout                                          |
| [anew](https://github.com/tomnomnom/anew)                   | Append lines from stdin to a file, but only if they don't already appear in the file                                                                              |
| [dnsvalidator](https://github.com/vortexau/dnsvalidator)    | Maintains a list of IPv4 DNS servers by verifying them against baseline servers, and ensuring accurate responses.                                                 |
| [dnsx](https://github.com/projectdiscovery/dnsx)            | A fast and multi-purpose DNS toolkit designed for running DNS queries                                                                                             |
| [gau](https://github.com/lc/gau)                            | Getallurls (gau) fetches known URLs from AlienVault's Open Threat Exchange, the Wayback Machine, Common Crawl, and URLScan for any given domain                   |
| [goop](https://github.com/nyancrimew/goop)                  | Yet another tool to dump a git repository from a website.                                                                                                         |
| [gowitness](https://github.com/sensepost/gowitness)         | A golang, web screenshot utility using Chrome Headless.                                                                                                           |
| [hakcheckurl](https://github.com/hakluke/hakcheckurl)       | Takes a list of URLs and returns their HTTP response codes                                                                                                        |
| [hakrawler](https://github.com/hakluke/hakrawler)           | Fast golang web crawler for gathering URLs and JavaScript file locations. This is basically a simple implementation of the awesome Gocolly library.               |
| [hqurlscann3r](https://github.com/hueristiq/hqurlscann3r)   | A web application attack surface mapping tool. It takes in a list of urls then performs numerous probes                                                           |
| [httprobe](https://github.com/tomnomnom/httprobe)           | Take a list of domains and probe for working http and https servers.                                                                                              |
| [httpx](https://github.com/projectdiscovery/httpx)          | Fast and multi-purpose HTTP toolkit that allows running multiple probes using the retryablehttp library                                                           |
| [massdns](https://github.com/blechschmidt/massdns)          | Stub DNS resolver, to perform bulk lookups.                                                                                                                       |
| [notify](https://github.com/projectdiscovery/notify)        | Stream the output of several tools (or read from a file) and publish it to a variety of supported platforms.                                                      |
| [qsreplace](https://github.com/tomnomnom/qsreplace)         | Accept URLs on stdin, replace all query string values with a user-supplied value, only output each combination of query string parameters once per host and path. |
| [sdlookup](https://github.com/j3ssie/sdlookup)              | IP Lookups for Open Ports and Vulnerabilities from internetdb.shodan.io                                                                                           |
| [subfinder](https://github.com/projectdiscovery/subfinder)  | Fast passive subdomain enumeration tool.                                                                                                                          |
| [subjs](https://github.com/lc/subjs)                        | subjs fetches javascript files from a list of URLS or subdomains.                                                                                                 |
| [trufflehog](https://github.com/trufflesecurity/trufflehog) | Find leaked credentials.                                                                                                                                          |
| [xurlfind3r](https://github.com/hueristiq/xurlfind3r/)      | Find domain's known URLs passively from several sources                                                                                                           |
| [JSFScan.sh](https://github.com/KathanP19/JSFScan.sh)       | Javascript recon automation                                                                                                                                       |

## Usage

```
echo "https://google.com"  | docker run -i securitybydesign/toolbox hakrawler -subs
```

For convenience you can export the commands directly in your zsh or bash profile and use as "local" commands

## Build locally

```
docker build . -t toolbox:latest
```

- With persistent volume (/mnt/toolbox)
```
docker compose up --build
```

# Utils

- [Wordlists](https://github.com/insecurecodes/athenaeum#wordlists)

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