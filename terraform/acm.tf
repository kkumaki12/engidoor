/* フロント側SSL証明書 */
/* resource "aws_acm_certificate" "engidoor-front-acm-tf" {
  domain_name               = aws_route53_record.engidoor-zone-record-tf.name
  subject_alternative_names = ["*.engidoor.com",]
  validation_method         = "DNS"
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    "Name" = "engidoor.com"
  }
} */
/* SSL証明書定義 */

/* resource "aws_acm_certificate" "engidoor-acm-tf" {
  domain_name               = aws_route53_record.engidoor-host-zone-record-tf.name
  subject_alternative_names = []
  validation_method         = "DNS"
  lifecycle {
    create_before_destroy = true
  }
} */

/* SSL検証 */
/* resource "aws_route53_record" "engidoor-certificate-tf" {
  name    = tolist(aws_acm_certificate.engidoor-acm-tf.domain_validation_options)[0].resource_record_name
  type    = tolist(aws_acm_certificate.engidoor-acm-tf.domain_validation_options)[0].resource_record_type
  records = [tolist(aws_acm_certificate.engidoor-acm-tf.domain_validation_options)[0].resource_record_value]
  zone_id = aws_route53_zone.engidoor-host-zone-tf.id
  ttl     = 60
}*/

/* 検証待機 */
/* resource "aws_acm_certificate_validation" "engidoor-acm-tf" {
  certificate_arn         = aws_acm_certificate.engidoor-acm-tf.arn
  validation_record_fqdns = [aws_route53_record.engidoor-certificate-tf.fqdn]
} */
