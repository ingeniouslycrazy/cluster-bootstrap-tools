terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.9.14"
    }
  }
  backend "local" {
    path = "/.state/terraform.tfstate"
  }
}

provider "proxmox" {
  pm_tls_insecure = true
}