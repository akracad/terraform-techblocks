terraform {
  required_providers {
    google = {
        source = "hashicorp/google"
        version = "4.0.0"
    }
    azure = {
      source = "hashicorp/azure"
      version = "3.4.5"
    }
     aws = {
      source = "hashicorp/aws"
      version = "5.89.0"
    }
  }
}

provider "google" {
    #config options
  
}

provider "aws" {
    #config options
  
}