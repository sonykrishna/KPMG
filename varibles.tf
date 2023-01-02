
variable "project_id" {
  description = "The ID of the project where this VPC will be created"
  default = "stalwart-space-322314"
}
variable "default_region" {
  default = "us-central1"
}
variable "default_zone" {
  default = "us-central1-a"
}
variable "network_name" {
  description = "The name of the network being created"
  default="terraform-vpc"
}
variable "routing_mode" {
  type        = string
  default     = "REGIONAL"
  description = "The network routing mode (default 'GLOBAL')"
}
variable "subnet_name" {
  type        = string
  default     = "terraform-subnet"
}
variable "ip_range"{
    type=string
    default="10.0.0.0/24"
}
variable "compute_name" {
  type        = string
  default     = "terraform-vm"
}
variable "machine_type"{
    type=string
    default="e2-medium"
}
variable "sql_name" {
  type="string"
default = "terraform-sql"
}
variable "database_version" {
  type="string"
  default = "MYSQL_8_0"
}
variable "tier_settings" {
  type="string"
  default = "db-n1-standard-2"
}
variable "tags" {
  type="[string]"
  default = ["https-server","http-server"]
  
}
variable "image" {
  type = "string"
  default = "debian-cloud/debian-11"
  
}
variable "sql_database"{
 type = "string"
  default = "terraform-test"
}
variable "charset"{
 type = "string"
  default = "utf8"
}
variable "collation"{
 type = "string"
  default = "utf8-general-cli"
}
variable "users"{
 type = "string"
  default = "krishna"
}
variable "host"{
 type = "string"
  default = "%"
}
variable "password"{
 type = "string"
  default = "krishnaprasanna"
}
variable "ip_v4" {
  type="string"
  default = "ipv4-address"
}