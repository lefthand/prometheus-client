prometheus_client_elasticsearch node.name do
  action :install
  server "http://localhost:9200"
end