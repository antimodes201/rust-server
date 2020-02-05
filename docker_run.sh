#!/bin/bash

docker rm rust
docker run -it -p 28015-28016:28015-28016/udp -p 28015-28016:28015-28016/tcp -v /app/docker/temp-vol:/app \
	--name rust antimodes201/rust-server:build
