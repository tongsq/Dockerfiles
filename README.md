# Dockerfiles
some Dockerfile for build docker image

# Usage
git clone https://github.com/tongsq/Dockerfiles.git

cd Dockerfiles/apache-php

sh download.sh

docker build -t apache-php:v1 .

# Run image
docker run -it -d -p 80:80 apache-php:v1

# 中文文档
[apache+php](http://www.jianshu.com/p/2fb677037844)


