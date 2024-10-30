resource "aws_s3_bucket" "website-buckets"{
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
