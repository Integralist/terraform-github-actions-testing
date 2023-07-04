terraform {
  required_providers {
    fastly = {
      source  = "fastly/fastly"
      version = "5.2.2"
    }
  }
}

# resource "fastly_service_vcl" "demo" {
#   name = "terraform-github-actions-testing"
#
#   domain {
#     name = "terraform-github-actions-testing.integralist-testing.co.uk"
#   }
#
#   backend {
#     address = "127.0.0.1"
#     name    = "localhost"
#     port    = 80
#   }
#
#   force_destroy = true
# }
