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
  name     = var.cluster_name
  location = var.zone

  remove_default_node_pool = true
  initial_node_count       = 1

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }
}

resource "google_container_node_pool" "node_pool" {
  name       = var.node_pool_name
  location   = var.zone
  cluster    = google_container_cluster.cluster.name
  node_count = var.num_nodes

  node_config {
    machine_type = var.machine_type

    service_account = google_service_account.service_account.email
    oauth_scopes    = var.oauth_scopes

  }
}

resource "google_compute_global_address" "static_ip" {
  name = var.global_address_name
}

resource "google_dns_record_set" "record" {
  name         = "${var.subdomain_name}.${var.domain_name}."
  managed_zone = var.dns_zone_name
  type         = "A"
  ttl          = 300

  rrdatas = ["${google_compute_global_address.static_ip.address}"]
}
