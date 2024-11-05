variable "s3_bucket_names" {
    type        = list(any)
    description = "The names of the buckets"
    default     = ["johnnyhuang.dev", "www.johnnyhuang.dev"]
}

variable "subdomain" {
    type    = string
    default = "www.johnnyhuang.dev"
}

variable "rootdomain" {
    type    = string
    default = "johnnyhuang.dev"
}

variable "cert_arn" {
  description = "ARN of AWS ACM certificate"
  type = string
  sensitive = true
}

variable "hosted_zone_id" {
  description = "Hosted Zone ID for Route53"
  type = string
  sensitive = true
}