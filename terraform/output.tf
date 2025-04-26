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
    db_host       = yandex_mdb_mysql_cluster.main.host[0].fqdn
    db_port       = 3306
    db_name       = yandex_mdb_mysql_cluster.main.database[0].name
    db_user       = yandex_mdb_mysql_cluster.main.user[0].name
    db_password   = yandex_mdb_mysql_cluster.main.user[0].password
  }
  sensitive = true
}