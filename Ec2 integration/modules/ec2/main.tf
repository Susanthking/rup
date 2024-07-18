resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name      = "my-key"

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
  subnet_id   = "subnet-12345678"
  private_ips = ["10.0.0.10"]
}

output "id" {
  value = aws_instance.example.id
}