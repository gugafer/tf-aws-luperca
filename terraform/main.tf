terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "sector-c"
    workspaces {
      name = "aws-root-lab"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Owner         = "Black Mesa"
      Project       = "Sector-C"
      Business_Unit = "Anomalous Materials"
      Environment   = "Hazardous"
    }
  }
}
