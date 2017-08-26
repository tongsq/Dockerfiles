FROM centos:latest
RUN yum install -y readline-devel pcre-devel openssl-devel gcc gcc-c++ perl make wget \
&& mkdir /data \
&& cd /data \
&& wget https://openresty.org/download/openresty-1.11.2.5.tar.gz \
&& tar -zxf openresty-1.11.2.5.tar.gz \
&& cd openresty-1.11.2.5 \
&& ./configure --prefix=/usr/local/openresty \
&& gmake \
&& gmake install \
&& yum clean all \
&& cd / \
&& rm -rf /data \
&& ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
ENTRYPOINT ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]
