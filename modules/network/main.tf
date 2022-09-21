

#######################
# Create the network and subnetworks, including secondary IP ranges on subnetworks
#######################

resource "google_compute_network" "network" {
  name                    = "${var.environment}-${var.network_name}"
  routing_mode            = "GLOBAL"
  auto_create_subnetworks = false
}

/* note that for secondary ranges necessary for GKE Alias IPs, the ranges have
 to be manually specified with terraform currently -- no GKE automagic allowed here. */
resource "google_compute_subnetwork" "subnetwork" {
  name                     = "${var.environment}-${var.subnetwork_name}"
  ip_cidr_range            = var.subnetwork_range
  network                  = google_compute_network.network.self_link
  region                   = var.region
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = "gke-pods-1"
    ip_cidr_range = var.subnetwork_pods
  }

  secondary_ip_range {
    range_name    = "gke-services-1"
    ip_cidr_range = var.subnetwork_services
  }

  dynamic "log_config" {
    /* this confusing for_each block only allows a single log_config element instead of a true loop.
     This is because we are just shoving the single map 'subnetwork_log_config' into a list.
     I believe this is the only way to get a conditional block. */
    for_each = var.subnetwork_flow_logs_enabled == false ? [] : [var.subnetwork_log_config]
    content {
      aggregation_interval = log_config.value["aggregation_interval"]
      flow_sampling        = log_config.value["flow_sampling"]
      metadata             = log_config.value["metadata"]
      metadata_fields      = log_config.value["metadata_fields"] == [] ? null : log_config.value["metadata_fields"]
      filter_expr          = log_config.value["filter_expr"] == "" ? null : log_config.value["filter_expr"]
    }
  }

  /* We ignore changes on secondary_ip_range because terraform doesn't list
    them in the same order every time during runs. */
  lifecycle {
    ignore_changes = [secondary_ip_range]
  }
}

resource "google_compute_router" "router" {
  count   = local.enable_cloud_nat
  name    = "${var.environment}-${var.network_name}"
  network = google_compute_network.network.name
  region  = var.region
}

resource "google_compute_address" "ip_address" {
  count  = local.cloud_nat_address_count
  name   = "nat-external-address-${count.index}"
  region = var.region
}

resource "google_compute_router_nat" "nat_router" {
  count                              = local.enable_cloud_nat
  name                               = "${var.environment}-${var.network_name}"
  router                             = google_compute_router.router.0.name
  region                             = var.region
  nat_ip_allocate_option             = var.nat_ip_allocate_option
  nat_ips                            = local.nat_ips
  min_ports_per_vm                   = var.cloud_nat_min_ports_per_vm
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  tcp_transitory_idle_timeout_sec    = var.cloud_nat_tcp_transitory_idle_timeout_sec

  log_config {
    enable = var.cloud_nat_log_config_filter == null ? false : true
    filter = var.cloud_nat_log_config_filter == null ? "ALL" : var.cloud_nat_log_config_filter
  }
}
