resource "kubernetes_service" "devops_app" {

  metadata {
    name = "devops-app"
  }

  spec {

    selector = {
      app = "devops-app"
    }

    port {
      port        = 80
      target_port = 5000
    }

    type = "ClusterIP"
  }
}
