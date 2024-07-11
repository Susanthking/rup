resource "aws_instance" "public" {
  count         = 2
  ami           = "ami-0c55b159cbfafe1f0" # Replace with your preferred AMI
  instance_type = "t2.micro"
  subnet_id     = element(var.public_subnets, count.index)

  tags = {
    Name = "PublicInstance-${count.index}"
  }
}

resource "aws_instance" "private" {
  count         = 2
  ami           = "ami-0c55b159cbfafe1f0" # Replace with your preferred AMI
  instance_type = "t2.micro"
  subnet_id     = element(var.private_subnets, count.index)

  tags = {
    Name = "PrivateInstance-${count.index}"
  }
}

variable "vpc_id" {}
variable "public_subnets" {
  type = list(string)
}
variable "private_subnets" {
  type = list(string)
}
variable "rds_subnets" {
  type = list(string)
}

