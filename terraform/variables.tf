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