#!/bin/sh
mvn clean package && docker build -t localhost:5000/blog-site .
docker rm -f blog-site || true && docker run -d -p 8080:8080 -p 4848:4848 --name blog-site localhost:5000/blog-site
