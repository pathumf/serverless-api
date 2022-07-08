#-------------------------------------
# SERVERLESS LAMBDA API
#-------------------------------------
resource "aws_lambda_function" "api" {
  function_name = "${var.env}-${var.app}"
  s3_bucket     = var.bucket
  s3_key        = var.s3_key
  runtime       = "go1.x"
  handler       = "main"

  source_code_hash = var.source_code_hash
  role             = aws_iam_role.lambda_exec.arn
}

resource "aws_cloudwatch_log_group" "logs" {
  name = "/aws/lambda/${aws_lambda_function.api.function_name}"

  retention_in_days = 30
}

resource "aws_iam_role" "lambda_exec" {
  name = "serverless_lambda"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Sid    = ""
      Principal = {
        Service = "lambda.amazonaws.com"
      }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "policy" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
