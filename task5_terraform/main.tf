terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

# Модуль диска
module "disk" {
  source    = "./modules/disk"
  disk_name = "boot-disk"
  disk_type = "network-ssd"
  disk_size = 30
  image_id  = "fd8bbhtvdodbbranefoe" # Ubuntu 24.04 LTS
  zone      = var.zone
}

# Модуль сети
module "network" {
  source       = "./modules/network"
  network_name = "network"
  subnet_name  = "subnet"
  subnet_cidr  = "192.168.10.0/24"
  zone         = var.zone
}

# Модуль группы безопасности
module "security_group" {
  source     = "./modules/security_group"
  network_id = module.network.network_id
  sg_name    = "vm-security-group"
}

# Модуль ВМ
module "compute" {
  source             = "./modules/compute"
  vm_name            = "terraform-vm"
  cores              = 2
  memory             = 4
  disk_id            = module.disk.disk_id
  subnet_id          = module.network.subnet_id
  security_group_ids = [module.security_group.sg_id]
  user_data          = file("meta.txt")
  zone               = var.zone
}

# Выводы
output "internal_ip_address_vm" {
  value = module.compute.internal_ip
}

output "external_ip_address_vm" {
  value = module.compute.external_ip
}