resource "aws_transfer_server" "example" {
  endpoint_type = "PUBLIC"
  identity_provider_type = "SERVICE_MANAGED"
  tags = {
    Name = "example"
  }
}

output "sftp_server_id" {
  value = aws_transfer_server.example.id
}