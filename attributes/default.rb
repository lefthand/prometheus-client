default.prometheus_client.cpu_arch      = "amd64"
default.prometheus_client.os            = node.os
default.prometheus_client.install_dir   = "/usr/bin"

default.prometheus_client.binary_path = "https://s3-us-west-2.amazonaws.com/scpr-binaries"

# -- Chef Handler Options -- #

default.prometheus_client.chef_handler.type       = "file"

# -- Node Exporter -- #

default.prometheus_client.checksums.node_exporter = {
  "linux.amd64" => "3898bfdcdfdbcaec7c5c3e0e5f26dad1c8554703a258d9a6d3400471847aa85b"
}

default.prometheus_client.node_exporter.collectors  = "diskstats,filesystem,loadavg,meminfo,textfile,time,netdev,netstat,stat"
default.prometheus_client.node_exporter.port        = "9100"
default.prometheus_client.node_exporter.service     = "prometheus-node-exporter"
default.prometheus_client.node_exporter.file_path   = "/var/run/prometheus/"

# -- HAProxy Exporter -- #

default.prometheus_client.checksums.haproxy_exporter = {
  "linux.amd64" => "7e389696678110f83e8332ed4f3e7baa04d0c422ccbedb0ccdbcdc4b13a56c68"
}

default.prometheus_client.haproxy_exporter.port     = "9101"
default.prometheus_client.haproxy_exporter.service  = "prometheus-haproxy-exporter"

# -- Consul Exporter -- #

default.prometheus_client.checksums.consul_exporter = {
  "linux.amd64" => "47f38e9f47a1d48f252ad5452be6bc97116ff29c8e39191cc2e6dad15545f6f7"
}

default.prometheus_client.consul_exporter.port     = "9105"
default.prometheus_client.consul_exporter.service  = "prometheus-consul-exporter"

# -- Elasticsearch Exporter -- #

default.prometheus_client.checksums.elasticsearch_exporter = {
  "linux.amd64" => "09dd381ab67e1302edd434f2e15a610142a76cf93427a105cce7b3b1aac4617f"
}

default.prometheus_client.elasticsearch_exporter.port     = "9106"
default.prometheus_client.elasticsearch_exporter.service  = "prometheus-elasticsearch-exporter"
