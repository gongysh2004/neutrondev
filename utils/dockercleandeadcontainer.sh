#!/bin/bash
docker ps -a -f status=exited -q  | xargs -r docker rm -v
