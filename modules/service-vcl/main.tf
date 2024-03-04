terraform {
  required_providers {
    fastly = {
      source  = "fastly/fastly"
      version = "5.7.0"
    }
  }
}

# resource "fastly_service_vcl" "demo" {
#   name = "testing-multiple-environments"
#
#   domain {
#     name = "testing-multiple-environments.integralist-new.co.uk"
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

locals {
  name         = "testing-github-actions"
  package_path = "./app.tar.gz"
}

data "fastly_package_hash" "api" {
  filename = local.package_path
}

resource "fastly_service_compute" "api" {
  name = local.name

  domain {
    name = "${local.name}.edgecompute.app"
  }

  package {
    filename         = local.package_path
    source_code_hash = data.fastly_package_hash.api.hash
  }

  resource_link {
    name        = local.name
    resource_id = fastly_configstore.api.id
  }

  force_destroy = true
}

resource "fastly_configstore" "api" {
  name = local.name
}
