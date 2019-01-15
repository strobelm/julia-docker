#!/bin/bash

docker build -t strobelm/julia:1.0 .
docker run -p 8888:8888 -t strobelm/julia:1.0
