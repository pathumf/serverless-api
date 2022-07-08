#---------------------------------
# S3 BUCKET FOR STORING ARTIFACTORY
#---------------------------------
resource "aws_s3_bucket" "bucket" {
  bucket = "artifactory-${var.env}-${var.region}"
}

resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.bucket.id

  key    = "${var.env}/${var.app}/${var.region}/${var.api_version}/api.zip"
  source = data.archive_file.artifact.output_path

  etag = filemd5(data.archive_file.artifact.output_path)
}