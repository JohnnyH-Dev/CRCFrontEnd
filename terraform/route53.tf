resource "aws_route53_zone" "main" {
    name = "johnnyhuang.dev"
}

resource "aws_route53_record" "main" {
    zone_id = aws_route53_zone.main.zone_id
    name = "johnnyhuang.dev"
    type = "A"
}