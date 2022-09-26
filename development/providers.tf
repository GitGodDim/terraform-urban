terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.22.0"
    }
  }
}
provider "google" {
  credentials = "ethereal-jigsaw-362607-1921c60b2d6d.json"
  project     = "ethereal-jigsaw-362607"
  region      = "us-central1"
}

