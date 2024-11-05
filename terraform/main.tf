terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
  cloud {
    organization = "JohnnyCRC"

    workspaces {
      name = "CRCFrontEnd"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}