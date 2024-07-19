resource "aws_efs_file_system" "example" {
  creation_token = "example-token"
}

resource "aws_efs_mount_target" "example" {
  file_system_id  = aws_efs_file_system.example.id
  subnet_id       = "subnet-06b1a4db88199323a"
}

output "id" {
  value = aws_efs_file_system.example.id
}