provider "google" {
version = "3.5.0"
project = var.project_id
region = var.default_region
zone = var.default_zone
}
resource "google_compute_network" "vpc_network" {
  name                            = var.network_name
  routing_mode                    = var.routing_mode
  project                         = var.project_id
  auto_create_subnetworks         = false
}
resource "google_compute_subnetwork" "public_subnetwork" {
    name = var.subnet_name
    ip_cidr_range = var.ip_range
    region = var.default_region
    network = google_compute_network.vpc_network.name
    private_ip_google_access = true
}

