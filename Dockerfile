FROM ubuntu
RUN apt update
RUN echo Y|apt upgrade
RUN apt install ssh wget npm -y
RUN npm install -g wstunnel
RUN mkdir /run/sshd 
RUN echo 'wstunnel -s 0.0.0.0:80 &' >>/runstart.sh
RUN echo '/usr/sbin/sshd -D' >>/runstart.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:tixiaohan|chpasswd
RUN chmod 755 /runstart.sh
EXPOSE 80
CMD  /runstart.sh
