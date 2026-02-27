FROM codercom/code-server:latest

USER root
RUN apt update && apt install -y git nodejs npm

RUN mkdir -p /home/coder/project
RUN chown -R coder:coder /home/coder

USER coder
WORKDIR /home/coder/project

ENV PASSWORD=abc123

CMD ["code-server", "--bind-addr", "0.0.0.0:8080"]
