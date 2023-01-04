/* provider block variables */
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

/* vpc block variables */
variable "network_name" {
  description = "The name of the network being created"
  default="terraform-vpc"
}
variable "routing_mode" {
  type        = string
  default     = "REGIONAL"
  description = "The network routing mode (default 'GLOBAL')"
}
/*subnet variables */
variable "subnet_name" {
  type        = string
  default     = "terraform-subnet"
}
variable "ip_range"{
    type=string
    default="10.0.0.0/24"
}
/* vm variables */
/* vm variables */
variable "compute_name" {
  type        = string
  default     = "terraform-vm"
}
variable "machine_type"{
    type=string
    default="e2-medium"
}

variable "boot_image"{
type=string
default="debian-cloud/debian-11"
}
variable "network_tags"{
  type=string
 default="allow-traffic"
}
variable "sa_email"{
  
default="748468258750-compute@developer.gserviceaccount.com"
}
/* firewall variables */
variable "firewall_name"{
  type=string
 default="terraform-firewall"
}
/* sql database variables */
variable "mysql_name"{
  type=string
 default="terraform-sql"
}
variable "mysql_version"{
  type=string
 default="MYSQL_8_0"
}
variable "mysql_tier"{
  type=string
 default="db-f1-micro"
}