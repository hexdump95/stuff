variable "project_id" {
  description = "project id"
  type        = string
}

variable "region" {
  description = "region"
  type        = string
}

variable "zone" {
  description = "zone"
  type        = string
}

variable "oauth_scopes" {
  description = "oauth scopes"
  type        = list(string)
}

variable "num_nodes" {
  description = "node count"
  type        = number
  default     = 3
}

variable "service_account_name" {
  description = "iam service account name"
  type        = string
}

variable "dns_zone_name" {
  description = "zone name"
  type        = string
}

variable "dns_name" {
  description = "example.com"
  type        = string
}
