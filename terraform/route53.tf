resource "aws_route53_record" "main" {
    name = var.subdomain
    type = "A"
    zone_id = var.hosted_zone_id

    alias {
      evaluate_target_health = false
      name = aws_cloudfront_distribution.main.domain_name
      zone_id = aws_cloudfront_distribution.main.hosted_zone_id
    }
}