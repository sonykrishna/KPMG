provider "google"{
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
