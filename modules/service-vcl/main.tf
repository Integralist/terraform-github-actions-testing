terraform {
  required_providers {
    fastly = {
      source  = "fastly/fastly"
      version = "5.2.2"
    }
  }
}

resource "fastly_service_vcl" "demo" {
  name = "testing-multiple-environments"

  domain {
    name = "testing-multiple-environments.integralist-new.co.uk"
  }

  backend {
    address = "127.0.0.1"
    name    = "localhost"
    port    = 80
  }

  force_destroy = true
}
