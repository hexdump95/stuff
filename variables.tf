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

variable "cluster_name" {
  description = "cluster name"
  type        = string
  default     = "cluster-0"
}

variable "node_pool_name" {
  description = "node pool name"
  type        = string
  default     = "node-pool"
}

variable "machine_type" {
  description = "node pool machine type"
  type        = string
  default     = "e2-medium"
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

variable "global_address_name" {
  description = "global address name"
  type        = string
  default     = "frontend-ip"
}

variable "service_account_name" {
  description = "iam service account name"
  type        = string
}

variable "dns_zone_name" {
  description = "zone name"
  type        = string
}

variable "subdomain_name" {
  description = "subdomain name"
  type        = string
  default     = "k8s"
}

variable "domain_name" {
  description = "example.com"
  type        = string
}
