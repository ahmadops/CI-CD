# variables.tf

variable "identity_name" {
  description = "Name of the User Assigned Identity"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group where resources will be created"
  type        = string
}

variable "resource_group_location" {
  description = "Location of the Resource Group"
  type        = string
}

variable "app_configuration_name" {
  description = "Name of the App Configuration instance"
  type        = string
}
