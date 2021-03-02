job "staticwebsite" {
  datacenters = ["dc1"]
  #type batch and type system are similar, however batch type jobs are intended to run until they exit sucessfully. instead of manually stopped by an operator.
  type = "service" 

  # A group defines a series of tasks that should be co-located
  # on the same client (host). All tasks within a group will be
  # placed on the same host.
  group "nginxexample" {
    # Specify the number of these tasks we want.
    count = 1

    network {
      # This requests a dynamic port named "http". This will
      # be something like "46283", but we refer to it via the
      # label "http".
      # label "http".
      
      # label "http".
      mode = "bridge"
    }

    # The service block tells Nomad how to register this service
    # with Consul for service discovery and monitoring.
    service {
      name = "${service_name}"
      port = 8080
    }

    task "setupstatichtml" {
      driver = "docker"
      artifact {
                source = "s3::http://127.0.0.1:9000/dev/tmp/my_first_webpage.tar"
                options {
                    aws_access_key_id = "minioadmin"
                    aws_access_key_secret = "minioadmin"
                }
      }
      config {
        load = "my_first_webpage.tar"
        image = "my_first_webpage:local"
      }
      resources {
        cpu    = 500 # MHz
        memory = 128 # MB
      }
    }
  }
}