# database.tf
resource "yandex_mdb_mysql_cluster" "main" {
  name        = "mysql-cluster"
  environment = "PRODUCTION"
  network_id  = yandex_vpc_network.network.id
  version     = "8.0"

  resources {
    resource_preset_id = "s2.micro"
    disk_type_id       = "network-ssd"
    disk_size          = 16
  }

  host {
    zone      = var.yc_default_zone
    subnet_id = yandex_vpc_subnet.subnet.id
  }
}

resource "yandex_mdb_mysql_database" "app_db" {
  cluster_id = yandex_mdb_mysql_cluster.main.id
  name       = "app_db"
}

resource "yandex_mdb_mysql_user" "app_user" {
  cluster_id = yandex_mdb_mysql_cluster.main.id
  name       = "app_user"
  password   = random_password.db_password.result
  
  permission {
    database_name = yandex_mdb_mysql_database.app_db.name
    roles         = ["ALL"]
  }
}

resource "random_password" "db_password" {
  length  = 16
  special = false
}