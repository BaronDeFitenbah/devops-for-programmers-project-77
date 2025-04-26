variable "yandex_api_token" {
  type = string
}

variable "datadog_api_key" {
  type = string
}

variable "datadog_app_key" {
  type = string
}

variable "datadog_domain" {
  type = string
}

variable "app_domain" {
  type = string
}

variable "ssh_public_key" {
  type = string
}
variable "yc_oauth_token" {
  description = "Yandex Cloud OAuth token"
  type        = string
  sensitive   = true
}

variable "yc_cloud_id" {
  description = "Yandex Cloud ID"
  type        = string
}

variable "yc_folder_id" {
  description = "Yandex Cloud Folder ID"
  type        = string
}

variable "yc_default_zone" {
  description = "Default availability zone for Yandex Cloud resources"
  type        = string
  default     = "ru-central1-a"
}