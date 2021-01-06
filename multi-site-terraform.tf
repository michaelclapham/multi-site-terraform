variable "token" {
  sensitive = true
}
variable "root_pass" {
  sensitive = true
}
variable "region" {
  default = "eu-west"
}

terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "~> 1.13.4"
    }
  }
}

# Linode Provider definition
provider "linode" {
  token = var.token
}

# Example Web Server
resource "linode_instance" "multi-site1" {
  image     = "linode/ubuntu18.04"
  label     = "multi-site1"
  group     = "Terraform"
  region    = var.region
  type      = "g6-nanode-1"
  swap_size = 1024
  root_pass = var.root_pass
}
