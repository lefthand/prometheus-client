default.prometheus_client.cpu_arch      = "amd64"
default.prometheus_client.os            = node.os
default.prometheus_client.install_dir   = "/usr/bin"

default.prometheus_client.binary_path = "https://s3-us-west-2.amazonaws.com/scpr-binaries"

# -- Node Exporter -- #

default.prometheus_client.checksums.node_exporter = {
  "linux.amd64" => "52c57bcbe8a17b18479a045f5bea21cdaff44b920d80e8c3d5afda6f9f165c19"
}

default.prometheus_client.node_exporter.collectors  = "diskstats,filesystem,loadavg,meminfo,textfile,time,netdev,netstat"
default.prometheus_client.node_exporter.port        = "9100"
default.prometheus_client.node_exporter.service     = "prometheus-node-exporter"

# -- HAProxy Exporter -- #

default.prometheus_client.checksums.haproxy_exporter = {
  "linux.amd64" => "7e389696678110f83e8332ed4f3e7baa04d0c422ccbedb0ccdbcdc4b13a56c68"
}

default.prometheus_client.haproxy_exporter.port     = "9101"
default.prometheus_client.haproxy_exporter.service  = "prometheus-haproxy-exporter"

# -- Consul Exporter -- #

default.prometheus_client.checksums.consul_exporter = {
  "linux.amd64" => "23d8d850ed74c596b9713ec41f882b2d598cab55924cd11316fe4a187053c814"
}

default.prometheus_client.consul_exporter.port     = "9105"
default.prometheus_client.consul_exporter.service  = "prometheus-consul-exporter"

