data "archive_file" "artifact" {
  type = "zip"

  source_dir  = "${path.cwd}/build"
  output_path = "${path.cwd}/build.zip"
}