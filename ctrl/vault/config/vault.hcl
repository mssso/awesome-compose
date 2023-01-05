storage "postgresql" {
  connection_url = "postgres://postgres:postgres@postgres:5432/audit?sslmode=disable"
}

listener "tcp" {
  address = "0.0.0.0:8200"
  tls_disable = "true"
}

ui = "true"
log_level="DEBUG"
