terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.24.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "techblocks-terraform"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = "./keys.json"
}

resource "google_storage_bucket" "techblocks-terraform-bucket1" {
    name = "techblock-terraform-bucket1"
    location = "us-central1"
}