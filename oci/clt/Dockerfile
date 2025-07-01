FROM ingeniouslycrazy/base:latest

ARG TERRAFORM_VERSION=1.12.2

RUN apk add --no-cache \
    py3-pip \
    py3-virtualenv \
    openssh \
    sshpass

# Python virtual environment & pip requirements
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN pip install --upgrade pip && \
    pip install ansible \
    ansible-lint \
    libpass \
    proxmoxer \
    requests

# Install terraform
RUN apk add --update --virtual .deps --no-cache gnupg && \
    cd /tmp && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_SHA256SUMS.sig && \
    wget -qO- https://www.hashicorp.com/.well-known/pgp-key.txt | gpg --import && \
    gpg --verify terraform_${TERRAFORM_VERSION}_SHA256SUMS.sig terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    grep terraform_${TERRAFORM_VERSION}_linux_amd64.zip terraform_${TERRAFORM_VERSION}_SHA256SUMS | sha256sum -c && \
    unzip /tmp/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /tmp && \
    mv /tmp/terraform /usr/local/bin/terraform && \
    rm -f /tmp/terraform_${TERRAFORM_VERSION}_linux_amd64.zip terraform_${TERRAFORM_VERSION}_SHA256SUMS ${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_SHA256SUMS.sig && \
    apk del .deps

# Download images
RUN mkdir /srv/iso
ADD https://dl-cdn.alpinelinux.org/alpine/v3.22/releases/x86_64/alpine-standard-3.22.0-x86_64.iso /srv/iso/alpine-standard-3.22.0-x86_64.iso
ADD https://releases.ubuntu.com/24.04.2/ubuntu-24.04.2-live-server-amd64.iso /srv/iso/ubuntu-24.04.2-live-server-amd64.iso

# Copy terraform files
COPY ./terraform /srv/terraform

# Copy ansible plays
COPY ./ansible /srv/ansible
# Prepare known_hosts, so ansible can do strict key checking
COPY ./oci/ansible/known_hosts /root/.ssh/known_hosts

# Start working here
WORKDIR /srv
