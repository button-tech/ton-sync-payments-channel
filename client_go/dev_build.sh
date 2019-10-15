#!/bin/bash

cd cmd
gox -osarch="linux/amd64"
cd ..
docker build -f Dockerfile.dev -t test .
docker run -it -p 3100:3100 -v /Users/erage/go/src/github.com/prazd/ton_build_sctipts/client_go/cmd/alice_data:/app/data test
