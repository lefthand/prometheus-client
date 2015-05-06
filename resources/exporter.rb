actions :delete
default_action :install

attribute :name,        kind_of:String,   required:true
attribute :exporter,    kind_of:String
attribute :binary,      kind_of:String
attribute :binary_url,  kind_of:String,   required:true
attribute :version,     kind_of:String,   required:true
attribute :checksums,   kind_of:Hash
attribute :install_dir, kind_of:String,   default:node.prometheus_client.install_dir
attribute :service,     kind_of:String
attribute :arguments,   kind_of:String
