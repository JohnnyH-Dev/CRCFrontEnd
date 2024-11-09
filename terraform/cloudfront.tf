resource "aws_cloudfront_origin_access_control" "main" {
    name = "s3-cloudfront-oac"
    origin_access_control_origin_type = "s3"
    signing_behavior = "always"
    signing_protocol = "sigv4"
}

resource "aws_cloudfront_distribution" "main" {
    enabled = true
    aliases = [var.subdomain]
    default_root_object = "index.html"
    is_ipv6_enabled = true
    wait_for_deployment = true

    default_cache_behavior {
      allowed_methods = [ "GET", "HEAD", "OPTIONS"]
      cached_methods = [ "GET", "HEAD", "OPTIONS"]
      target_origin_id = aws_s3_bucket.s3_website_buckets[1].id
      viewer_protocol_policy = "redirect-to-https"
      cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6"

      forwarded_values {
        headers = ["Origin"]
        query_string = "false"
        cookies {
          forward = "none"
        }
      }
    }

    origin {
      domain_name = aws_s3_bucket.s3_website_buckets[1].bucket_regional_domain_name
      origin_access_control_id = aws_cloudfront_origin_access_control.main.id
      origin_id = aws_s3_bucket.s3_website_buckets[1].id
    }

    restrictions {
      geo_restriction {
        restriction_type = "none"
      }
    }

    viewer_certificate {
      acm_certificate_arn = var.cert_arn
      minimum_protocol_version = "TLSv1.2_2021"
      ssl_support_method = "sni-only"
    }
}
