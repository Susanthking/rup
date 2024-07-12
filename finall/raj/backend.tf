terraform {
  backend "s3" {
    bucket         = "demo_remote_backend"
    key            = "terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

resource "aws_s3_bucket" "example" {
  bucket = "example-bucket-name"
  acl    = "private"

  tags = {
    Name        = "Example Bucket"
    Environment = "Dev"
  }
}

