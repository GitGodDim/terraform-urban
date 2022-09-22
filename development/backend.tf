terraform {
  backend "gcs" {
    bucket = "terraform-bucketurban34"
    prefix = "terraform/state"
  }
}

resource "google_storage_bucket" "statebucket" {
  name          = "urban-bucket-tfstate"
  force_destroy = false
  location      = "us-central1"
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}