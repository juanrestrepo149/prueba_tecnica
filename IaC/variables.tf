variable "namespace_name" {
  description = "The name of the namespace"
  type        = string
  default     = ""
}

variable "app_name" {
  description = "The name of the application"
  type        = string
  default     = ""
}

variable "image_name" {
  description = "The Docker image to deploy"
  type        = string
  default     = ""
}

variable "container_port" {
  description = "The port the container listens on"
  type        = number
  default     = 80
}

variable "service_type" {
  description = "The type of Kubernetes service"
  type        = string
  default     = "ClusterIP"
}
