actions :delete
default_action :install

attribute :port,        kind_of:String,   default:node.prometheus_client.haproxy_exporter.port
attribute :service,     kind_of:String,   default:node.prometheus_client.haproxy_exporter.service
attribute :scrape_uri,  kind_of:String,   required:true
