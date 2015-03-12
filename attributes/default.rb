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

