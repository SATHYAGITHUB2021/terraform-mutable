data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket         = "sathya-aws-bucket"
    key            = "mutable/vpc/${var.ENV}/terraform.tfstate"
    region         = "us-east-1"
  }
}
