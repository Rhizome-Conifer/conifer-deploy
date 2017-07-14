## Webrecorder Ansible Setup

*Tested in Ubuntu 14.04, 16.04*

Installs nginx, docker and SSL certs for `wr_app_host` and `wr_content_host` domains, and then starts Webrecorder in Docker.
Strongly recommended for `wr_app_host` and `wr_content_host` domains to be separate domains, though can be the same domain.

Usage: `./run.sh wr_app_host=example.webrecorder.io wr_content_host=example.wbrc.io`


