variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

variable "gke_num_nodes" {
  default     = 3
  description = "number of gke nodes"
}

variable "region" {
  default = "europe-west4"
  description = "region"
}

variable "project_id" {
  default = "hw1proj-356816"
  description = "project id"
}
