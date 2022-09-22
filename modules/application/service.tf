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
resource "kubernetes_ingress" "urban_ingress" {
  metadata {
    name = "urban-ingress"
     annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }

  spec {
    backend {
      service_name = "dev-urban"
      service_port = 3000
    }

    rule {
      http {
        path {
          backend {
            service_name = "dev-urban"
            service_port = 3000
          }

          path = "/"
        }

        path {
          backend {
            service_name = "dev-urban"
            service_port = 3000 # should be prometheus in the future
          }

          path = "/metrics/*"
        }
      }
    }

    tls {
      secret_name = "tls-secret"
    }
  }
}
# resource "helm_release" "kube-prometheus" {
#   name       = "kube-prometheus-stackr"
#   namespace  = var.namespace
#   version    = var.kube-version
#   repository = "https://prometheus-community.github.io/helm-charts"
#   chart      = "kube-prometheus-stack"
#}