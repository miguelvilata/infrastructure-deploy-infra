resource "aws_acm_certificate" "cert" {
  domain_name       = var.domain_name
  subject_alternative_names = var.subject_alternative_names
  validation_method = var.validation_method
}

data "aws_route53_zone" "zone" {
  name         = var.dns_zone_name
  private_zone = var.private_zone
}

resource "aws_route53_record" "cert_validation" {
  name    = aws_acm_certificate.cert.domain_validation_options.0.resource_record_name
  type    = aws_acm_certificate.cert.domain_validation_options.0.resource_record_type
  zone_id = data.aws_route53_zone.zone.id
  records = [aws_acm_certificate.cert.domain_validation_options.0.resource_record_value]
  ttl     = 60
}

resource "aws_acm_certificate_validation" "cert" {
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [aws_route53_record.cert_validation.fqdn]
}
