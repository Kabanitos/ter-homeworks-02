###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "vm_web_default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network"
}

variable "vm_web_vpc_name" {
  type        = string
  default     = "develop_web"
  description = "subnet name"
}

variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Укажите ОС"

}


variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v2"
  description = "Укажите платформу"
}


variable "vm_web_preemptible" {
  type        = bool
  default     = true
  description = "С прерыванием или нет"
}

variable "vm_web_nat" {
  type        = bool
  default     = "true"
  description = "Включить nat "
}

# variable "vm_web_serial-port-enable" {
#   type    = number
#   default = 1
# }


variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
    platform_id   = string
  }))
  default = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 5
      platform_id   = "standard-v2"

    }

    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
      platform_id   = "standard-v2"
    }
  }
}
#variable "vm_web_yandex_compute_instance" {

# type = object({
#   name          = string
#   platform_id   = string
#   cores         = number
#   memory        = number
#   core_fraction = number
# })
# default = {
#   name = "netology-develop-platform-web"
#   platform_id = "standard-v2"
#   cores = 2
#   memory = 1
#   core_fraction = 5
# }
#}


###ssh vars

# variable "vm_web_vms_ssh_root_key" {
#   type        = string
#   default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFjeEOGD6Conv4furMWud4yGqKg1NRo1zX4/zWpOOMZe a.mishanin@MacBook-Pro-Aleksandr.local"
#   description = "ssh-keygen -t ed25519"
# }

variable "metadata" {
  type = map(object({
    serial-port-enable = number
    ssh-keys           = string
  }))

  default = {
    web = {
      serial-port-enable = 1
      ssh-keys           = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFjeEOGD6Conv4furMWud4yGqKg1NRo1zX4/zWpOOMZe a.mishanin@MacBook-Pro-Aleksandr.local"
    },

    db = {
      serial-port-enable = 1
      ssh-keys           = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFjeEOGD6Conv4furMWud4yGqKg1NRo1zX4/zWpOOMZe a.mishanin@MacBook-Pro-Aleksandr.local"


    }
  }
}
