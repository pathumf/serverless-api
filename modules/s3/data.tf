data "archive_file" "artifact" {
  type = "zip"

  source_dir  = "${path.module}/main"
  output_path = "${path.module}/main.zip"
}