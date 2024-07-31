# Terraform configuration for deploying Kubernetes resources
# to a Minikube cluster.

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "default" {
  metadata {
    name = var.namespace_name
  }
}

resource "kubernetes_deployment" "app" {
  metadata {
    name = var.app_name
    namespace = kubernetes_namespace.default.metadata[0].name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = var.app_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.app_name
        }
      }

      spec {
        container {
          name  = var.app_name
          image = var.image_name
          port {
            container_port = var.container_port
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "app" {
  metadata {
    name = var.app_name
    namespace = kubernetes_namespace.default.metadata[0].name
  }

  spec {
    selector = {
      app = var.app_name
    }
    port {
      port        = var.container_port
      target_port = var.container_port
    }
    type = var.service_type
  }
}
