locals {
  cluster_workload_identity_namespace = var.enable_workload_identity ? ["${var.project}.svc.id.goog"] : []
  metering_bigquery_dataset           = length(var.metering_bigquery_dataset) > 0 ? [var.metering_bigquery_dataset] : []
}
