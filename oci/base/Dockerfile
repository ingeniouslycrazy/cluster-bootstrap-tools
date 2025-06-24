FROM alpine:latest

# zsh & oh-my-zsh
RUN apk add --no-cache bind-tools curl dnsmasq git vim zsh zsh-autosuggestions zsh-syntax-highlighting
RUN sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
RUN echo "source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc && \
    echo "source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

# Configure DNS
COPY ./oci/base/resolv.conf /etc/resolv.conf
COPY ./oci/base/dnsmasq.conf /etc/dnsmasq.conf
RUN apk add --no-cache

# Set entrypoin
CMD ["zsh"]
