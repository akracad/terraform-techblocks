terraform {
  required_version = ">= 1.2.0l"
  required_providers {
    random = {
        source = "hashicorp/random"
        version = "1.0.0"
    }
  }
}

provider "random" {
  #config options
}