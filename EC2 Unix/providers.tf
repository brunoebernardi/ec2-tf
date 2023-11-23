terraform {
    required_version = ">=0.13.1"
    required_providers {
      aws =   ">=3.37.0"
      local = ">=2.1.0"
    }
}

provider "aws" {
region = var.aws_region 
access_key = ""
secret_key = ""

}