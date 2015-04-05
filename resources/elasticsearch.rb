actions :delete
default_action :install

attribute :port,        kind_of:String,   default:node.prometheus_client.elasticsearch_exporter.port
attribute :service,     kind_of:String,   default:node.prometheus_client.elasticsearch_exporter.service
attribute :server,      kind_of:String,   required:true
