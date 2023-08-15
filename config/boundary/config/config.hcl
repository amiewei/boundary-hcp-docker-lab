disable_mlock = true

listener "tcp" {
  address = "0.0.0.0:9203"
  purpose = "proxy"
}

worker {
  initial_upstreams = ["51561818-c692-22b1-de85-46e3e02c9808.proxy.boundary.hashicorp.cloud:9202"]  //update this with the ip of your hcp-worker
  auth_storage_path = "/boundary-hcp-worker/file/worker"
  tags {
    type = ["worker", "dockerlab"]
  }
}

