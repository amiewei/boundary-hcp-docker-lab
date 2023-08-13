disable_mlock = true

listener "tcp" {
  address = "0.0.0.0:9203"
  purpose = "proxy"
}

worker {
  initial_upstreams = ["f8908630-55af-8e68-0ba7-dc289b14996f.proxy.boundary.hashicorp.cloud:9202"]  //update this with the ip of your hcp-worker
  auth_storage_path = "/boundary-hcp-worker/file/dockerlabworker"
  tags {
    type = ["worker", "dockerlab"]
  }
}

