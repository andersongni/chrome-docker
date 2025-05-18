# Usar uma imagem base compatível
FROM ubuntu:24.04

# Instalar dependências essenciais e Chrome
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        wget ca-certificates dbus x11vnc xvfb x11-utils dbus-x11 \
        libpci3 libegl1 openbox \
    && update-ca-certificates \
    && wget -O /tmp/google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && apt-get install -y --no-install-recommends /tmp/google-chrome.deb \
    && rm /tmp/google-chrome.deb \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Script de inicialização do VNC e Chrome
RUN echo '#!/bin/bash\n\
Xvfb :99 -screen 0 1920x1080x24 &\n\
export DISPLAY=:99\n\
openbox &\n\
sleep 2\n\
x11vnc -display :99 -nopw -listen 0.0.0.0 -forever &\n\
google-chrome --no-default-browser-check --no-sandbox --disable-dev-shm-usage --disable-gpu --disable-software-rasterizer --window-size=1920,1080 --no-first-run --disable-features=ChromeWhatsNewUI --disable-default-apps --test-type 2>/dev/null &\n\nwait' > /usr/local/bin/start-chrome && chmod +x /usr/local/bin/start-chrome

# Expor a porta VNC
EXPOSE 5900

# Comando de inicialização do container
CMD ["/usr/local/bin/start-chrome"]
