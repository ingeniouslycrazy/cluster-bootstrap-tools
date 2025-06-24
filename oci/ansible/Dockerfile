FROM ingeniouslycrazy/base:latest

RUN apk add --no-cache \
    py3-pip \
    py3-virtualenv \
    openssh \
    sshpass

# Prepare known_hosts, so ansible can do strict key checking
COPY ./oci/ansible/known_hosts /root/.ssh/known_hosts

# Python virtual environment & pip requirements
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN pip install --upgrade pip && \
    pip install ansible \
    ansible-lint \
    libpass \
    proxmoxer \
    requests

# Local ansible plays
COPY ./ansible /ansible
WORKDIR /ansible
