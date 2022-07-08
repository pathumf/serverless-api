
output "bucket_name" {
  description = "Name of the S3 bucket used to store function code."
  value       = aws_s3_bucket.bucket.id
}
output "archive_file_path" {
  description = "artifact output path"
  value       = aws_s3_object.object.id

}