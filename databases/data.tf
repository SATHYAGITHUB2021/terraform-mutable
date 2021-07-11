data "aws_ami" "centos7" {
  most_recent      = true
  name_regex       = "^Centos-7-DevOps-Practice"
  owners           = ["973714476881"]
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket         = "sathya-aws-bucket"
    key            = "mutable/vpc/${var.ENV}/terraform.tfstate"
    region         = "us-east-1"
  }
}
//output "ami" {
//  value = data.aws_ami.centos7
//}

data "aws_secretsmanager_secret" "secrets" {
  name = "${var.ENV}-env"
}
data "aws_secretsmanager_secret_version" "secrets" {
  secret_id = data.aws_secretsmanager_secret.secrets.id
}

output "secrets" {
  value = jasoncode(data.aws_secretsmanager_secret_version.secrets.secret_string)["SSH_USER"]
}
