resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "example" {
  key_name   = "example-key"
  public_key = tls_private_key.example.public_key_openssh
}

resource "local_file" "private_key" {
  content  = tls_private_key.example.private_key_pem
  filename = "${path.module}/example-key.pem"
  file_permission = "0400"
}
resource "aws_instance" "example" {
  ami           = "ami-078701cc0905d44e4"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.example.key_name

  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.example.id
  }

  user_data = <<-EOF
              #!/bin/bash
              yum install -y amazon-efs-utils
              mkdir /mnt/efs
              mount -t efs fs-12345678:/ /mnt/efs
              EOF
}

resource "aws_network_interface" "example" {
  subnet_id   = "subnet-06b1a4db88199323a"
  private_ips = ["10.0.0.10"]
}

output "id" {
  value = aws_instance.example.id
}