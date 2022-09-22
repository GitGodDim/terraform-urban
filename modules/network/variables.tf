#######################
# Define all the variables we'll need
#######################

variable "network_name" {
  description = "the name of the network"
}

variable "subnetwork_name" {
  description = "name for the subnetwork"
}

variable "subnetwork_range" {
  description = "CIDR for subnetwork nodes"
}

variable "subnetwork_pods" {
  description = "secondary CIDR for pods"
}

variable "subnetwork_services" {
  description = "secondary CIDR for services"
}

variable "region" {
  description = "region to use"
}

variable "enable_cloud_nat" {
  # https://cloud.google.com/nat/docs/overview#ip_address_allocation
  description = "Setup Cloud NAT gateway for VPC"
  default     = false
}

variable "nat_ip_allocate_option" {
  # https://cloud.google.com/nat/docs/overview#ip_address_allocation
  description = "AUTO_ONLY or MANUAL_ONLY"
  type        = string
  default     = "AUTO_ONLY"
}

variable "cloud_nat_address_count" {
  # https://cloud.google.com/nat/docs/overview#number_of_nat_ports_and_connections
  description = "the count of external ip address to assign to the cloud-nat object"
  type        = number
  default     = 1
}

variable "cloud_nat_min_ports_per_vm" {
  description = "Minimum number of ports allocated to a VM from this NAT."
  type        = number
  default     = 64
}

variable "cloud_nat_tcp_transitory_idle_timeout_sec" {
  # https://cloud.google.com/nat/docs/overview#specs-timeouts
  description = "Timeout in seconds for TCP transitory connections."
  type        = number
  default     = 30
}

variable "cloud_nat_log_config_filter" {
  description = "Specifies the desired filtering of logs on this NAT"
  default     = null
}

variable "subnetwork_flow_logs_enabled" {
  description = "If you want to set up flow logs you will need to set this to enabled and update subnetwork_flow_logs variable defaults if necessary."
  default     = false
}

variable "subnetwork_log_config" {
  /* If any of these need to be overriden, you will need to put the _ENTIRE_ block in your var setting or else you will get an error.
    https://www.terraform.io/docs/providers/google/r/compute_subnetwork.html#example-usage-subnetwork-logging-config */
  description = "settings for subnetwork flow logs"
  default = {
    aggregation_interval = "INTERVAL_5_SEC"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
    metadata_fields      = []
    filter_expr          = ""
  }
}

variable "environment" {
  description = "Environment name"
  type        = string
}
