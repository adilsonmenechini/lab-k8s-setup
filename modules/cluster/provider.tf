terraform {
  required_version = ">=1.5.1"

  required_providers {

    kind = {
      source  = "tehcyx/kind"
      version = "0.4.0"
    }
  }
}

provider "kind" {}