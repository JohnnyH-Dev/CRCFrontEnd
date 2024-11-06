data "aws_iam_policy_document" "cloudfront_oac" {
    statement {
      principals {
        identifiers = ["cloudfront.amazonaws.com"]
        type = "Service"
      }
    actions = [
        "s3:GetObject"
        ]
    resources = [
        "${aws_s3_bucket.s3_website_buckets[1].arn}/*"
        ]
    condition {
      test = "StringEquals"
      values = [aws_cloudfront_distribution.main.arn]
      variable = "AWS:SourceArn"
        }
    }
}