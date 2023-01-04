provider "google"{
project = var.project_id
region = var.default_region
zone = var.default_zone
}
/* vpc module */
resource "google_compute_network" "vpc_network" {
  name                            = var.network_name
  routing_mode                    = var.routing_mode
  project                         = var.project_id
  auto_create_subnetworks         = false
}
/*subnet module */
resource "google_compute_subnetwork" "public_subnetwork" {
    name = var.subnet_name
    ip_cidr_range = var.ip_range
    region = var.default_region
    network = google_compute_network.vpc_network.name
    private_ip_google_access = true
}
/* compute instance  module*/
resource "google_compute_instance" "compute_instance" {
  name=var.compute_name
  machine_type=var.machine_type
  zone=var.default_zone
  boot_disk {
    initialize_params {
      image = var.boot_image
    }
  }
  network_interface {
    network = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.public_subnetwork.name
    access_config {
    }
  }
   service_account {
    email=var.sa_email
    scopes=["cloud-platform"]
  }
  tags=[var.network_tags]
}
/* firewall module */
resource "google_compute_firewall" "firewall_rule" {
  name    = var.firewall_name
source_ranges=["0.0.0.0/0"]
source_tags=null
source_service_accounts=null
  network = google_compute_network.vpc_network.name
  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "443","22"]
  }

  target_tags = [var.network_tags]
}
/*sql instance */
resource "google_sql_database_instance" "instance" {
  name             = var.mysql_name
  region           = var.default_region
  database_version = var.mysql_version
  settings {
    tier = var.mysql_tier
  }
deletion_protection = false
}
/* sql data user */
resource "google_sql_user" "users" {
  name     = "user"
  instance = google_sql_database_instance.instance.name
  password = "root"
}