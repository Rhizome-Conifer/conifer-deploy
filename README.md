## Webrecorder Deployment (using Ansible)

*Tested on Ubuntu 14.04, 16.04, CentOS 7*

A production-ready [Ansibile](https://www.ansible.com/) playbook for configuring and deploying Webrecorder.

This setup is used for the https://webrecorder.io/ deployment.

The `run.sh` script  installs Ansible, if not already installed, on the current host. The playbook installs nginx, generates new certs using [Let's Encrypt](https://letsencrypt.org/), installs Docker, and latest [Webrecorder code](https://github.com/webrecorder/webrecorder)

For production, a separate domain for the Webrecorder application and for the domain serving recorded content is stongly recommended due to potential security issues of single-domain setup. ([Slides from our talk](http://labs.rhizome.org/presentations/security.html#/10) on this issue)

The following deployment options are available:

- ### Production Deployment -- Separate Domains (Strongly Recommended)

Installs front-end nginx, Docker and gets SSL certs from Lets Encrypt for `wr_app_host` and `wr_content_host` domains, and then starts Webrecorder in Docker.
Strongly recommendeded for `wr_app_host` and `wr_content_host` domains to be separate domains

Usage: `./run.sh "wr_app_host=example.webrecorder.io wr_content_host=example.wbrc.io"`

Webrecorder should then be accessible via `https://example.webrecorder.io` and content loaded from `https://example.wbrc.io`

- ### Deployment -- Same Domain (Not Recommended)

Same as above, but uses only a single domain. Installs front-end nginx and gets SSL certs from Lets Encrypt

Usage: `./run.sh "wr_app_host=example.webrecorder.io"`

Webrecorder should then be accessible via `https://example.webrecorder.io` and content is also loaded from the same domain.

- ### Local Deployment Only -- No SSL Certs or frontend nginx

Installs Docker only, no front-end nginx or ssl certs

Usage: `./run.sh`

Webrecorder accessible on port 8089 via: `http://localhost:8089/`, but not on port 80.


