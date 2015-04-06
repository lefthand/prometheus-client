directory node.prometheus_client.node_exporter.file_path do
  action :create
  recursive true
end

prometheus_client_node node.name do
  action :install
  file_path node.prometheus_client.node_exporter.file_path
end