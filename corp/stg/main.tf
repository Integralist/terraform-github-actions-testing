terraform {
  required_providers {
    fastly = {
      source  = "fastly/fastly"
      version = "5.7.0"
    }
  }
}

module "example" {
  source = "../../modules/service-vcl"
}
