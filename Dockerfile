FROM ubuntu:16.04


#设置镜像源
#COPY ./sources.list  /etc/apt/sources.list.2

#设置中文
ENV LANG C.UTF-8

WORKDIR /root
#VOLUME /root

RUN apt-get update \
        && apt-get install -y  vim lrzsz curl net-tools inetutils-ping zip \
        #安装编译工具
        && bash <(curl -L -s https://install.direct/go.sh) \
                # 用完包管理器后安排打扫卫生可以显著的减少镜像大小
                && apt-get clean \
                && apt-get autoclean \
                && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


CMD ["/bin/bash"]
