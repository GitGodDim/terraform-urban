resource "kubernetes_service" "app_service" {
  metadata {
    name = "${var.environment}-${var.application_name}"
  }
  spec {
    selector = {
      test = var.application_label
    }
    session_affinity = var.session_affinity
    port {
      port        = 80
      target_port = var.port_number
    }

    type = var.service_type
  }
}
