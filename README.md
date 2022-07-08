
# Tech Test

## Task01 - Scenario Base
please follow the link: [scenario](./scenario/scenario.md)

## Task02 - Lambda deploy
This is a simple go hello world application that's invoked using an API gateway. Please locate the API gateway url.

api : https://cs5hsprzs9.execute-api.us-east-1.amazonaws.com/dev-serverless-api-stage/api

When a PR is merged to the main branch, the dev pipeline will kicked in deploy resources to the test AWS account. When a tag is released, we can initiate a pipeline to deploy QA and PROD with a gate


TODO 
-  improve readme 
    - local testing
    - local go lang env setup 
    - step to un unit test
    - terraform fmt and validate steps

- 
