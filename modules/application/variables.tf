variable "config_path" {
  description = "Kubernete config path"
  type        = string
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
  description = "Container image name"
  type        = string
}

variable "deployment_resources" {
  description = "Resources that used by deployment"
  type = map(object({
    cpu    = string,
    memory = string
  }))
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

variable "environment" {
  description = "Environment name"
  type        = string
}
