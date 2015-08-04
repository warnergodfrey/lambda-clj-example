#!/bin/bash -e

workdir=$(pwd)

docker build -t warnergodfrey/lambda-clj-example $workdir

docker run -v $workdir:/var/app warnergodfrey/lambda-clj-example
