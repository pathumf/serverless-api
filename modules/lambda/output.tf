output "invork_arn" {
  value       = aws_lambda_function.api.invoke_arn
  description = "The Lambda function invork arn"
}

output "lambda_name" {
  value       = aws_lambda_function.api.function_name
  description = "The name of the lambda function"
}

