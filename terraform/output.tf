output "ansible_inventory" {
  value = <<-DOC
    [webservers]
    ${yandex_compute_instance.vm_1.name} ansible_host=${yandex_compute_instance.vm_1.network_interface.0.nat_ip_address}
    ${yandex_compute_instance.vm_2.name} ansible_host=${yandex_compute_instance.vm_2.network_interface.0.nat_ip_address}
    DOC
}

output "database_credentials" {
  value = {
    db_cluster_id = yandex_mdb_mysql_cluster.main.id
    db_host       = one(yandex_mdb_mysql_cluster.main.host[*].fqdn)
    db_port       = 3306
    db_name       = yandex_mdb_mysql_database.app_db.name
    db_user       = yandex_mdb_mysql_user.app_user.name
    db_password   = yandex_mdb_mysql_user.app_user.password
  }
  sensitive = true
}