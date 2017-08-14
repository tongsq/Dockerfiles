FROM debian:jessie
ADD php-7.1.8.tar.gz httpd-2.4.27.tar.gz apr-1.6.2.tar.gz apr-util-1.6.0.tar.gz /src/
RUN apt-get update \
&& apt-get install -y  \
gcc \
make \
&& cd /src/apr-1.6.2 \
&& ./configure --prefix=/usr/local/apr/ \ 
&& make \
&& make install \
&& cd /src/apr-util-1.6.0 \
&& apt-get install -y libexpat1-dev --no-install-recommends \
&& ./configure \
--prefix=/usr/local/apr-util/ \
--with-apr=/usr/local/apr/ \
&& make \
&& make install \
&& cd /src/httpd-2.4.27 \
&& apt-get install -y libpcre++0 libpcre++-dev zlib1g-dev --no-install-recommends \
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
&& apt-get update && apt-get -y install libxml2-dev libcurl4-openssl-dev libssh-dev pkg-config --no-install-recommends \
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
&& rm -r /var/lib/apt/lists/*
COPY httpd.conf /usr/local/apache/conf/
COPY php.ini /usr/local/php/lib/
EXPOSE 80
CMD ["/usr/local/apache/bin/httpd", "-DFOREGROUND"]
