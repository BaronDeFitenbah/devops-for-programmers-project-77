# Поиск образа Ubuntu в Yandex Cloud
data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2204-lts" # Семейство образов Ubuntu 22.04 LTS
}

# Создание первой виртуальной машины (аналог web1)
resource "yandex_compute_instance" "web1" {
  name        = "terra-web-1"
  platform_id = "standard-v1" # Платформа виртуальной машины
  zone        = var.yc_default_zone # Зона доступности

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id # Используем найденный образ
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id # Подсеть
    nat       = true # Включение NAT для доступа к интернету
  }
  
  metadata = {
    ssh-keys = "ubuntu:${var.ssh_public_key}"
  }
}

# Создание второй виртуальной машины (аналог web2)
resource "yandex_compute_instance" "web2" {
  name        = "terra-web-2"
  platform_id = "standard-v1"
  zone        = var.yc_default_zone

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}