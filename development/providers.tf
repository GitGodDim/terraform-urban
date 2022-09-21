provider "google" {
  credentials = "ethereal-jigsaw-362607-1921c60b2d6d.json"
  project     = "ethereal-jigsaw-362607"
  region      = "us-central1"
}

provider "kubernetes" {
  config_path = "~/.kube/config"
  alias       = "kubernetes"
}