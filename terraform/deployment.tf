resource "kubernetes_deployment" "devops_app" {

  metadata {
    name = "devops-app"

    labels = {
      app = "devops-app"
    }
  }

  spec {

    replicas = 4

    selector {
      match_labels = {
        app = "devops-app"
      }
    }

    template {

      metadata {
        labels = {
          app = "devops-app"
        }
      }

      spec {

        container {

          name  = "devops-app"
          image ="devops-app:latest"
          image_pull_policy = "IfNotPresent"

          port {
            container_port = 5000
          }

          readiness_probe {
            http_get {
              path = "/health"
              port = 5000
            }
          }

          liveness_probe {
            http_get {
              path = "/health"
              port = 5000
            }
          }

        }
      }
    }
  }
}