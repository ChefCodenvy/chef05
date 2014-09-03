FROM     ubuntu:12.04
RUN apt-get update && apt-get -y install sudo curl mc rpm openssh-server openssh-client tree && \
        curl -L https://www.opscode.com/chef/install.sh | sudo bash && \
        curl -O https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/chefdk-0.2.0-2.el6.x86_64.rpm && \
        sudo rpm -Uvh chefdk-0.2.0-2.el6.x86_64.rpm --nodeps
RUN sudo mkdir /var/run/sshd
CMD    ["/usr/sbin/sshd", "-D"]
RUN sudo echo 'root:root' |chpasswd
EXPOSE 22
ADD ./chef-starter.zip /root/
RUN cd /root && unzip -qq /root/chef-starter.zip && rm /root/chef-starter.zip 
