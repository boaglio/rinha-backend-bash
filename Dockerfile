FROM ubuntu AS base
RUN apt update && apt install -y netcat socat gnupg curl jq
RUN curl -fsSL https://pgp.mongodb.com/server-7.0.asc | gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor
RUN echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-7.0.list 
RUN apt update &&  apt install -y mongodb-mongosh
WORKDIR /app

FROM base AS prod
COPY . .
EXPOSE 3000
CMD ["bash", "netcat.bash"]
