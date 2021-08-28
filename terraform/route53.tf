resource "aws_route53_zone" "engidoor-host-zone-tf" {
  name    = "back.engidoor.com"
  comment = "back.engidoor host zone"
}

resource "aws_route53_record" "engidoor-host-zone-record-tf" {
  zone_id = aws_route53_zone.engidoor-host-zone-tf.zone_id
  name    = aws_route53_zone.engidoor-host-zone-tf.name
  type    = "A"

  alias {
    name                   = aws_lb.engidoor-back-alb-tf.dns_name
    zone_id                = aws_lb.engidoor-back-alb-tf.zone_id
    evaluate_target_health = true
  }
}


# フロント用
resource "aws_route53_zone" "engidoor-zone-tf" {
  name = "engidoor.com"
  tags = {
    "engidoor" = "engidoor.com" 
  }
}
resource "aws_route53_record" "engidoor-zone-record-tf" {
  zone_id = aws_route53_zone.engidoor-zone-tf.id
  name = aws_route53_zone.engidoor-zone-tf.name
  type = "A"

  alias {
    name = aws_lb.engidoor-alb-tf.dns_name
    zone_id = aws_lb.engidoor-alb-tf.zone_id
    evaluate_target_health = true
  }
}
