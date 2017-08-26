FROM centos:latest
ADD php-7.1.8.tar.gz httpd-2.4.27.tar.gz apr-1.6.2.tar.gz apr-util-1.6.0.tar.gz /src/
RUN yum -y install gcc make zlib-devel pcre-devel pcre \
&& cd /src/apr-1.6.2 \
&& ./configure --prefix=/usr/local/apr/ && make && make install \
&& cd /src/apr-util-1.6.0 \
&& yum -y install expat-devel \
&& ./configure --prefix=/usr/local/apr-util/ --with-apr=/usr/local/apr/ \
&& make && make install \
&& cd /src/httpd-2.4.27 \
&& ./configure  \
 --prefix=/usr/local/apache/ \
 --with-apr=/usr/local/apr/ \
 --with-apr-util=/usr/local/apr-util/ \
 --enable-so \
 --enable-deflate=shared \
 --enable-expires=shared \
 --enable-rewrite=shared \
 --enable-static-support \
&& make && make install \
&& cd /src/php-7.1.8 \
&& yum -y install libxml2-devel \
&& yum -y install openssl openssl-devel libcurl-devel perl \
&& sed -i '1i\#!/usr/bin/perl -w' /usr/local/apache/bin/apxs \
&& ./configure \
--prefix=/usr/local/php \
--with-pdo-mysql \
--with-curl \
--enable-bcmath \
--with-openssl \
--enable-mbstring \
--enable-opcache \
--with-apxs2=/usr/local/apache/bin/apxs \
&& make && make install \
&& rm -rf /src \
&& ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime 
COPY httpd.conf /usr/local/apache/conf/
COPY php.ini /usr/local/php/lib/
EXPOSE 80
CMD ["/usr/local/apache/bin/httpd", "-DFOREGROUND"]
