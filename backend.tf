terraform {
    backend "s3" {
      bucket = "honey-aws-terraform"
      key = "honeys-terraform"
      region = "ca-central-1"
    }
}