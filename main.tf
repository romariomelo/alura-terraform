terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.0"
    }
  }

  required_version = ">= 0.14"
}

provider "aws" {
  region  = "us-east-2"
  profile = "trial"
}

provider "aws" {
  region  = "us-east-1"
  alias   = "us-east-1"
  profile = "trial"
}


