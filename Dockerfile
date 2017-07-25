FROM node

RUN apt-get update \
  && apt-get -y install openssh-server \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd 

ARG password
RUN sh -c "echo root:${password:-changeme} |chpasswd"

RUN sed -i '/PermitRootLogin/c\PermitRootLogin yes' /etc/ssh/sshd_config

WORKDIR /usr/src/app
RUN echo "cd /usr/src/app" >> /root/.bash_profile 

# Put all our code inside that directory that lives in the container
ADD . /usr/src/app

RUN \
    	npm install -g bower && \
    	npm install && \
	bower install --config.interactive=false --allow-root

# Tell Docker we are going to use this port
EXPOSE 80
EXPOSE 22

ENTRYPOINT service ssh start && node server/app.js
