resource "yandex_mdb_mysql_cluster" "main" {
  name        = "terra-mysql-cluster"
  environment = "PRESTABLE" # или PRODUCTION
  network_id  = yandex_vpc_network.network.id

  resources {
    resource_preset_id = "s2.micro"
    disk_size          = 10
    disk_type_id       = "network-ssd"
  }

  database {
    name = "terra-db"
  }

  user {
    name     = "terra-user"
    password = "your_password"
  }

  labels = {
    project = "hexlet-terraform-03"
    environment = "Development"
  }
}

