## Common variables
region = "us-central1"
network_name = "kube"
project_name = "terraform-module-cluster"
environment = "dev"

## Cluster
cluster_name = "gke-example"
kubernetes_version = "1.22.12-gke.300"

## Network
subnetwork_name  = "kube-subnet"
subnetwork_range = "10.40.0.0/16"
subnetwork_pods = "10.41.0.0/16"
subnetwork_services = "10.42.0.0/16"

## Node Pool
node_pool_name = "gke-urban-node-pool"
machine_type = "n1-standard-4"
min_node_count = "1"
max_node_count = "2"

## Application
application_name = "urban"
application_label = "UrbanApp"
deployment_resources = {
  limits = {
    cpu    = "0.5"
    memory = "512Mi"
  },
  requests = {
    cpu    = "250m"
    memory = "50Mi"
  }
}
container_image = "gcr.io/ethereal-jigsaw-362607/urbapp@sha256:8254139b3db4090f9f33b83645b6c68c9566fa7033cb7beeb6deeb32c22b8db6"
replicas_number = 3
http_path = "/"
port_number = 3000
service_type = "LoadBalancer"
session_affinity = "ClientIP"