resource "aws_s3_bucket" "s3_website_buckets"{
    count = length(var.s3_bucket_names)
    bucket = var.s3_bucket_names[count.index]
}

resource "aws_s3_bucket_website_configuration" "s3_root_website"{
    bucket = var.s3_bucket_names[0]

    redirect_all_requests_to {
        host_name = var.subdomain
        protocol = "https"
    }
}

resource "aws_s3_bucket_website_configuration" "s3_subroot_website" {
    bucket = var.s3_bucket_names[1]

    index_document {
      suffix = "index.html"
    }
}   

resource "aws_s3_bucket_policy" "main" {
    bucket = aws_s3_bucket.s3_website_buckets[1].id
    policy = data.aws_iam_policy_document.cloudfront_oac.json
}
