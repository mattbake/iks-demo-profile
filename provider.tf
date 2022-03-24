# Intersight Provider Information
terraform {
  required_providers {
    intersight = {
      source = "ciscodevnet/intersight"
      version = "1.0.18"
    }
  }
}

provider "intersight" {
  apikey    = var.api_key
  secretkey = var.secretkey
  endpoint  = "https://intersight.com"
}