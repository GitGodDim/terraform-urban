
resource "kubernetes_deployment" "app_deployment" {
  metadata {
    name = "${var.environment}-${var.application_name}"
    labels = {
      test = var.application_label
    }
  }

  spec {
    replicas = var.replicas_number

    selector {
      match_labels = {
        test = var.application_label
      }
    }

    template {
      metadata {
        labels = {
          test = var.application_label
        }
      }

      spec {
        container {
          image = var.container_image
          name  = var.application_name

          resources {
            limits = {
              cpu    = var.deployment_resources["limits"].cpu
              memory = var.deployment_resources["limits"].memory
            }
            requests = {
              cpu    = var.deployment_resources["requests"].cpu
              memory = var.deployment_resources["requests"].memory
            }
          }

          liveness_probe {
            http_get {
              path = var.http_path
              port = var.port_number

              http_header {
                name  = "X-Custom-Header"
                value = "Awesome"
              }
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}
