actions :delete
default_action :install

attribute :collectors,  kind_of:String,   default:node.prometheus_client.node_exporter.collectors
attribute :port,        kind_of:String,   default:node.prometheus_client.node_exporter.port
attribute :service,     kind_of:String,   default:node.prometheus_client.node_exporter.service
attribute :file_path,   kind_of:String,   default:nil