storage "consul" {
  address = "127.0.0.1:8500"
  path    = "vault"
}

ui = true

listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = 1
}