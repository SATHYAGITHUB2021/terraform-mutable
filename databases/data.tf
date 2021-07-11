data "aws_ami" "centos7" {
  most_recent      = true
  name_regex       = "^Centos-7-DevOps-Practice"
  owners           = ["973714476881"]
}

output "ami" {
  value = data.aws_ami.centos7
}

//data "terraform_remote_state" "vpc" {
//  backend = "s3"
//
//  config = {
//    bucket         = "sathya-aws-bucket"
//    key            = "mutable/vpc/${var.ENV}/terraform.tfstate"
//    region         = "us-east-1"
//  }
//}