service {
  name                = "product"
  address             = ""
  enable_tag_override = false
  port                = 5000
  tags                = ["prod"]

  connect = {
    proxy = {
      config = {
        upstreams = [
          {
            destination_name = "mongodb"
            local_bind_port  = 5001
          },
        ]
      }
    }
  }
}

checks = [
  {
    id         = "product-tcp"
    interval   = "10s"
    name       = "product server on 8000"
    tcp        = "localhost:5000"
    timeout    = "1s"
    service_id = "product"
  },
  {
    id              = "product-health"
    interval        = "10s"
    timeout         = "1s"
    name            = "product server /healthz"
    http            = "http://localhost:5000/product/healthz"
    tls_skip_verify = true
    service_id      = "product"
  },
  {
    id              = "product-proxy-health"
    interval        = "10s"
    timeout         = "1s"
    name            = "product server /healthz"
    http            = "http://localhost:5000/product/healthz"
    tls_skip_verify = true
    service_id      = "product-proxy"
  },
]
