FROM ubuntu
USER root
RUN apt update
RUN useradd -m -s /bin/bash frontend
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - 
RUN apt-get install -y nodejs
RUN yes | npm -g install @angular/cli
WORKDIR /opt/pool-ui
RUN chown -R frontend:frontend /opt/pool-ui
USER frontend
COPY . .
RUN npm install
ENTRYPOINT ["/usr/bin/ng", "serve", "--host", "0.0.0.0"]

