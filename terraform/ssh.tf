resource "yandex_compute_instance" "vm" {
  name        = "terraform-vm"
  platform_id = "standard-v3"  # или другой тип (standard-v1, standard-v2 и т. д.)
  
  resources {
    cores  = 2
    memory = 2  # ГиБ
  }

  boot_disk {
    initialize_params {
      image_id = "fd81hgrcv6lsnkremf32"  # Пример: Ubuntu 22.04 LTS
      size     = 10  # ГиБ
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id  # Укажите свою подсеть
    nat       = true  # Включить NAT для доступа из интернета
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_public_key}"  # Формат: "пользователь:ключ"
  }
}