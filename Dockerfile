FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

ENV TZ=Asia/Ho_Chi_Minh

ENV PORT=8080
-------------------------------
RUN apt update && apt install -y \
    curl \
    tzdata \
    ca-certificates \
    python3 \
    && ln -fs /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*
CMD bash -c '\
echo "🇻🇳 Timezone: $TZ"; \
echo "🌐 Starting fake web service on port $PORT"; \
python3 -m http.server $PORT >/dev/null 2>&1 & \
echo "🚀 Starting SSHX..."; \
curl -sSf https://sshx.io/get | sh -s run \
'
