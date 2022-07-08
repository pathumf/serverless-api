variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "The resources that are being deployed to this region"
}

variable "env" {
  type        = string
  default     = "dev"
  description = "The resources that are being deployed to this env"
}

variable "app" {
  type        = string
  default     = "serverless-api"
  description = "The Api name"
}

variable "api_version" {
  type        = string
  default     = "v1.0.1"
  description = "Tag or commit hash"
}

