variable "vm_db_default_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "vm_db_default_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vm_db_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Укажите ОС"
  
}

variable "vm_db_vpc_name" {
  type        = string
  default     = "develop_db"
  description = "subnet name"
}


variable "vm_db_platform_id" {
  type = string
  default = "standard-v2"
  description = "Укажите платформу"
}


variable "vm_db_preemptible" {
  type = bool
  default = true
  description = "С прерыванием или нет"
}

variable "vm_db_nat" {
  type = bool
  default = "true"
  description = "Включить nat "
}

variable "vm_db_serial-port-enable" {
  type = number
  default = 1
}

variable "vm_db_yandex_compute_instance" {
  type = object({
    name          = string
    platform_id   = string
    cores         = number
    memory        = number
    core_fraction = number 
  })
  default = {
    name = "netology-develop-platform-db"
    platform_id = "standard-v2"
    cores = 2
    memory = 2
    core_fraction = 20
  }
}


###ssh vars

variable "vm_db_vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEcJoWqqcrEaHNhXdfamU9lTjLznakAQMYG2gyLvwiSy alex@MiWiFi-RA72-srv"
  description = "ssh-keygen -t ed25519"
}