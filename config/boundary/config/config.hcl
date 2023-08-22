disable_mlock = true

listener "tcp" {
  address = "0.0.0.0:9203"
  purpose = "proxy"
}

worker {
  initial_upstreams = ["a8fe3ee6-bcd1-f630-00da-d66a87b2f153.proxy.boundary.hashicorp.cloud:9202"]  //update this with the ip of your hcp-worker
  auth_storage_path = "/boundary-hcp-worker/file/worker"
  tags {
    type = ["worker", "dockerlab"]
  }
}

