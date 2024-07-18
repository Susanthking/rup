resource "aws_ses_domain_identity" "example" {
  domain = "example.com"
}

resource "aws_ses_domain_dkim" "example" {
  domain = aws_ses_domain_identity.example.domain
}

output "ses_identity_arn" {
  value = aws_ses_domain_identity.example.arn
}
