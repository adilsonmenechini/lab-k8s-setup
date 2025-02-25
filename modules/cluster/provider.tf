terraform {
  required_version = ">=1.6.0"

  required_providers {

    kind = {
      source  = "tehcyx/kind"
      version = "0.4.0"
    }
    docker = {
     source  = "kreuzwerker/docker"
     version = "3.0.2"
   }
  }
}

provider "kind" {}

provider "docker" {}
