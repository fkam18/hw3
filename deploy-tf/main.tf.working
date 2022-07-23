terraform {
  required_version = "1.2.5"
}

#-----------------------------------------
# Default provider: Kubernetes
#-----------------------------------------

provider "kubernetes" {
  config_context = "gke_hw1proj-356816_europe-west4_hw1proj-356816-gke"
}


#-----------------------------------------
# KUBERNETES DEPLOYMENT COLOR APP
#-----------------------------------------

resource "kubernetes_deployment" "color" {
    metadata {
        name = "color-blue-dep"
        labels = {
            app   = "color"
            color = "blue"
        } 
    } 
    
    spec {
        selector {
            match_labels = {
                app   = "color"
                color = "blue"
            } //match_labels
        } //selector

        #Number of replicas
        replicas = 3

        #Template for the creation of the pod
        template { 
            metadata {
                labels = {
                    app   = "color"
                    color = "blue"
                } //labels
            } //metadata

            spec {
                container {
                    image = "fkam18/nodejsapp:1.0"   #Docker image name
                    name  = "color-blue"          #Name of the container specified as a DNS_LABEL. Each container in a pod must have a unique name (DNS_LABEL).
                    
                    #Block of string name and value pairs to set in the container's environment
                    env { 
                        name = "COLOR"
                        value = "blue"
                    } //env
                    
                    #List of ports to expose from the container.
                    port { 
                        container_port = 3000
                    }//port          
                    
                    resources {
                        limits {
                            cpu    = "0.5"
                            memory = "512Mi"
                        } //limits
                        requests {
                            cpu    = "250m"
                            memory = "50Mi"
                        } //requests
                    } //resources
                } //container
            } //spec
        } //template
    } //spec
} //resource

#-------------------------------------------------
# KUBERNETES DEPLOYMENT COLOR SERVICE NODE PORT
#-------------------------------------------------

resource "kubernetes_service" "color-service-np" {
  metadata {
    name = "color-service-np"
  } //metadata
  spec {
    selector = {
      app = "color"
    } //selector
    session_affinity = "ClientIP"
    port {
      port      = 80
//      node_port = 30085
      target_port = 3000
    } //port
    type = "LoadBalancer"
  } //spec
} //resource
