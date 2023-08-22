storage "raft" {
  path    = "/vault/file"
  node_id = "node1"
}

listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = 1
}

api_addr     = "http://192.168.1.199:8200"
cluster_addr = "http://192.168.1.199:8201"
ui           = true
