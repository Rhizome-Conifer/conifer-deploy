## Webrecorder Ansible Setup

*Tested in Ubuntu 14.04, 16.04, CentOS 7*

### Production Deployment -- Separate Domains (Recommended)

Installs front-end nginx, Docker and gets SSL certs from Lets Encrypt for `wr_app_host` and `wr_content_host` domains, and then starts Webrecorder in Docker.
Strongly recommendeded for `wr_app_host` and `wr_content_host` domains to be separate domains

Usage: `./run.sh wr_app_host=example.webrecorder.io wr_content_host=example.wbrc.io`

Webrecorder should then be accessible via `https://example.webrecorder.io` and content loaded from `https://example.wbrc.io`

### Deployment -- Same Domain

Same as above, but uses only a single domain. Installs front-end nginx and gets SSL certs from Lets Encrypt

Usage: `./run.sh wr_app_host=example.webrecorder.io`

Webrecorder should then be accessible via `https://example.webrecorder.io` and content loaded from `https://example.wbrc.io`

### Local Deployment Only -- No SSL Certs or frontend nginx

Installs Docker only, no front-end nginx or ssl certs

Usage: `./run.sh`

Webrecorder accessible on port 8089 via: `http://localhost:8089/`


