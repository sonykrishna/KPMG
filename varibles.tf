variable "version"{
    type=string
    default="3.5.0"
}
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
