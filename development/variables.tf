variable "environment" {
  description = "Environment name"
  type        = string
}

variable "region" {
  description = "The region where the GKE cluster will be created"
  type        = string
}

variable "network_name" {
  description = "The name of the network to use by GKE cluster"
  type        = string
}

variable "subnetwork_name" {
  description = "Name for the subnetwork"
  type        = string
}

variable "subnetwork_range" {
  description = "CIDR for subnetwork nodes"
  type        = string
}

variable "subnetwork_pods" {
  description = "Secondary CIDR for pods"
  type        = string
}
variable "subnetwork_services" {
  description = "Secondary CIDR for services"
  type        = string
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
}

variable "project_name" {
  description = "Google project name"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version to use"
  type        = string
}

variable "node_pool_name" {
  description = "Name of the node pool name"
  type        = string
}

variable "machine_type" {
  description = "Machine instance type to use in node pool"
  type        = string
}

variable "min_node_count" {
  description = "Minimum number of nodes in node pool"
  type        = string
}

variable "max_node_count" {
  description = "Maximum number of nodes in node pool"
  type        = string
}

variable "deployment_resources" {
  description = "Resources that used by deployment"
  type = map(object({
    cpu    = string,
    memory = string
  }))
}

variable "application_name" {
  description = "Name of the application"
  type        = string
}

variable "application_label" {
  description = "Label of the application"
  type        = string
}

variable "container_image" {
  description = "Name of the container image"
  type        = string
}

variable "http_path" {
  description = "HTTP path to use by deployment"
  type        = string
}

variable "port_number" {
  description = "Port number to use by deployment"
  type        = string
}

variable "replicas_number" {
  description = "Number of replicas"
  type        = number
}

variable "service_type" {
  description = "Type of the service to use"
  type        = string
}

variable "session_affinity" {
  description = "Session affinity to use by service"
  type        = string
}
variable "kubernetes_config_path" {
  description = "Path to Kubernetes config"
  type        = string
}