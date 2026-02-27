FROM codercom/code-server:latest

USER root

# Cài thêm tool nếu muốn
RUN apt update && apt install -y \
    git \
    curl \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Tạo thư mục project
RUN mkdir -p /home/coder/project
WORKDIR /home/coder/project

# Set password cho code-server
ENV PASSWORD=123456

USER coder

EXPOSE 8080

CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "/home/coder/project"]
