terraform {
  required_version = "~> 1.0"
}

#---------------------------
# ARTIFACTORY BUCKET
#---------------------------
module "s3-bucket" {
  source      = "./modules/s3"
  app         = var.app
  env         = var.env
  region      = var.aws_region
  api_version = var.api_version
}

# ----------------------------
# SERVERLESS LAMBDA FUNCTION
# ----------------------------
module "lambda" {
  source           = "./modules/lambda"
  app              = var.app
  env              = var.env
  bucket           = module.s3-bucket.bucket_name
  s3_key           = module.s3-bucket.archive_file_path
  source_code_hash = module.s3-bucket.source_code_hash
  
  depends_on = [
    module.s3-bucket,
  ]
}


#----------------------------------
# API GATWAY INTERGRATION
#----------------------------------

module "api-gatway" {
  source      = "./modules/apigateway"
  app         = var.app
  env         = var.env
  invork_arn  = module.lambda.invork_arn
  lambda_name = module.lambda.lambda_name
    
  depends_on = [
    module.lambda,
  ]
}
