terraform {
  required_providers {
    kubernetes = {
      source                = "hashicorp/google"
      configuration_aliases = [kubernetes]
    }
  }
}
