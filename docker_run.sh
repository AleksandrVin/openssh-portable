#!/bin/bash
docker run -d -p 127.0.0.1:2222:22 -p 127.0.0.1:1305:1305 --name ubuntu_host ubuntu_host