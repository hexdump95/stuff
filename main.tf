terraform {
  backend "gcs" {
    bucket = "cloud-evaluacion-k8s"
    prefix = "terraform"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_container_cluster" "cluster" {
  name     = "cluster-0"
  location = var.zone

  remove_default_node_pool = true
  initial_node_count       = 1

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }
}

resource "google_container_node_pool" "node_pool" {
  name       = "node-pool"
  location   = var.zone
  cluster    = google_container_cluster.cluster.name
  node_count = var.num_nodes

  node_config {
    machine_type = "e2-medium"

    service_account = google_service_account.service_account.email
    oauth_scopes    = var.oauth_scopes

  }
}

resource "google_compute_global_address" "static_ip" {
  name = "frontend-ip"
}

resource "google_dns_record_set" "subdomain" {
  name         = "k8s.${var.dns_name}."
  managed_zone = var.dns_zone_name
  type         = "A"
  ttl          = 300

  rrdatas = ["${google_compute_global_address.static_ip.address}"]
}
