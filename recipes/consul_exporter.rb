prometheus_client_consul node.name do
  action :install
  server "localhost:8500"
end