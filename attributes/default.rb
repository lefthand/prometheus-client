# this seems to cover my cases, but I'm sure it isn't perfect
default.prometheus_client.cpu_arch      =
  case node.kernel.machine
  when 'x86_64' then "amd64"
  else
    node.kernel.machine
  end

default.prometheus_client.os            = node.os

default.prometheus_client.install_dir   = "/usr/bin"

default.prometheus_client.binary_path = "https://s3-us-west-2.amazonaws.com/scpr-binaries"

# -- Chef Handler Options -- #

default.prometheus_client.chef_handler.type       = "file"

# -- Node Exporter -- #

default.prometheus_client.node_exporter.version = "0.8.1"

default.prometheus_client.node_exporter.checksums = {
  "0.8.1.darwin-amd64"  => "e1abc7f9855ecddbf0dad0ae74d1dd0f73ebbbd1d54ac9e58cd59ff8bfb1bb1f",
  "0.8.1.linux-386"     => "7bd9970a2dacf6b6ba1a39b7d6abd8b015bfa6dc2444e2867ac278d01489b3d8",
  "0.8.1.linux-amd64"   => "c031fa9c8dd8526eef91b00599b5b242e455332b90421ba08a77b4bb045a0081",
  "0.8.1.linux-arm"     => "7bb0d98cb9d63f4bfb8017587dfab08cfbee7cc03c7b5d0e36e01e5166ca385f",
}

default.prometheus_client.node_exporter.collectors  = "diskstats,filesystem,loadavg,meminfo,textfile,time,netdev,netstat,stat"
default.prometheus_client.node_exporter.port        = "9100"
default.prometheus_client.node_exporter.service     = "prometheus-node-exporter"
default.prometheus_client.node_exporter.file_path   = "/var/run/prometheus/"

# -- HAProxy Exporter -- #

default.prometheus_client.haproxy_exporter.version = "0.4.0"

default.prometheus_client.haproxy_exporter.checksums = {
  "0.4.0.darwin-amd64"  => "91407e538085333346afd0a54924e315acc4923e2635d59022f95ca34d66d011",
  "0.4.0.linux-386"     => "156bd6ce34bf2f2a00c7d8e99783beff07cb4b31176f73597b962e4e72861fc9",
  "0.4.0.linux-amd64"   => "5a3de4f5253bff6b2d9f0fc717b992d945d9e62f3c5cc07fd843ecebfdf16fa9",
  "0.4.0.linux-arm"     => "03912a23d51946fca790491da59f86dbc10c7bcbfdc506743101ddd27e3e4b03"
}

default.prometheus_client.haproxy_exporter.port     = "9101"
default.prometheus_client.haproxy_exporter.service  = "prometheus-haproxy-exporter"

# -- Consul Exporter -- #

default.prometheus_client.consul_exporter.version = "0.1.0"

default.prometheus_client.consul_exporter.checksums = {
  "0.1.0.darwin-amd64"  => "856d8a6acd04cf13dbc2172388173ba513786019acfd9f7c24bfb515ea4f8b84",
  "0.1.0.linux-386"     => "8f8c16b5ef4bcb6adc183efaca45b101c8b7964afdff8deaac92731286b67ec1",
  "0.1.0.linux-amd64"   => "6b4495eb35d49183d7f458d97d8e572dae630e66a39f7738a7ac31cbab962298",
  "0.1.0.linux-arm"     => "2e17aac17974436377aa77db9b0c128aca76e1d01e411745928eed865089d7c5",
}

default.prometheus_client.consul_exporter.port     = "9105"
default.prometheus_client.consul_exporter.service  = "prometheus-consul-exporter"

# -- Elasticsearch Exporter -- #

default.prometheus_client.elasticsearch_exporter.version = "0.2.0"

default.prometheus_client.elasticsearch_exporter.checksums = {
  "0.1.1.darwin-amd64"  => "98862498936721841a4dac89890ca7af03ab1b95d7e893fed86b5e6358025e84",
  "0.1.1.linux-amd64"   => "09b3e5d15b4157f8ceeb38b747a4cda73500cd4c77c02116ca44c179d763c398",
  "0.2.0.darwin-amd64"  => "2511b106d56c0123d1a6208a9283474224afbd9d68fe5c9c682dc12507d37461",
  "0.2.0.linux-amd64"   => "042bd27fec12e9ead46d3e08c8f86856fb60574654f2bc9a456d63649f2f1b26",
}

default.prometheus_client.elasticsearch_exporter.port     = "9106"
default.prometheus_client.elasticsearch_exporter.service  = "prometheus-elasticsearch-exporter"
