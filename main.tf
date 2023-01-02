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
resource "google_compute_subnetwork" "public_subnetwork" {
    name = var.subnet_name
    ip_cidr_range = var.ip_range
    region = var.default_region
    network = google_compute_network.vpc_network.name
    private_ip_google_access = true
}


resource "google_compute_address" "static" {
  name = var.ip_v4
}
resource "google_compute_instance" "compute_instance" {
  name=var.compute_name
  machine_type=var.machine_type
  zone=var.default_zone
  region=var.default_region
  boot_disk {
    initialize_params {
      image = var.boot_image
    }
  }
  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
      nat_ip = google_compute_address.static.address
    }
  }
  tags = var.tags
}
resource "google_sql_database_instance" "sql_database" {
  name = var.sql_name
database_version =var.sql_version
region = var.default_region
settings {
tier = var.tier_settings
ip_configuration {

      dynamic "authorized_networks" {
        content {
          name  = var.sql_add_network
         // value =google_compute_instance.compute_instance.network_interface.access_config.nat_ip
        }
      }
}
}
}
resource "google_sql_database" "sql_database" {
name = var.sql_database
instance = google_sql_database_instance.sql_database.name
charset = var.charset
collation = var.collation
}
resource "google_sql_user" "users" {
name = var.sql_user
instance =google_sql_database_instance.sql_database.name
host = var.host
password = var.password
}