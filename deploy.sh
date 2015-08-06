#!/bin/bash -e

AWS_ACCOUNT_ID=$1

export AWS_DEFAULT_REGION=us-east-1

aws lambda delete-function \
  --function-name clj-hello

aws lambda create-function \
  --function-name clj-hello \
  --handler hello::handler \
  --runtime java8 \
  --memory 512 \
  --timeout 10 \
  --role arn:aws:iam::$AWS_ACCOUNT_ID:role/lambda_exec_role \
  --zip-file fileb://./target/lambda-clj-examples-0.1.0-standalone.jar

docker run -i -t -v $(pwd)/resources/swagger.json:/var/app/swagger.json -v ~/.aws:/root/.aws warnergodfrey/aws-apigateway-swagger -c /var/app/swagger.json
