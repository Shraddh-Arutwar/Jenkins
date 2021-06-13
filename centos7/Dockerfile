FROM centos:7

RUN yum -y install openssh-server

RUN useradd user1 && \
    echo "1234" | passwd user1 --stdin && \ 
    mkdir /home/user1/.ssh && \
    chmod 700 /home/user1/.ssh

COPY ./remote-key.pub /home/user1/.ssh/authorized_keys

RUN chown -R user1:user1 /home/user1/.ssh && \
    chmod 600 /home/user1/.ssh/authorized_keys

RUN /usr/sbin/sshd-keygen

RUN yum install mysql -y 

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    yum install unzip -y && \
    unzip awscliv2.zip && \
    ./aws/install

CMD /usr/sbin/sshd -D 
