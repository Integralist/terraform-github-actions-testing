terraform {
  required_providers {
    fastly = {
      source = "fastly/fastly"
      version = "5.2.2"
    }
  }
}

module "example" {
  source    = "../../modules/service-vcl"
}
