use_inline_resources

action :install do
  options = {
    "collectors.enabled" => new_resource.collectors,
    "web.listen-address" => ":#{new_resource.port}",
  }

  if new_resource.file_path
    directory node.prometheus_client.node_exporter.file_path do
      action :create
      recursive true
    end

    options["collector.textfile.directory"] = new_resource.file_path
  end

  prometheus_client_exporter "node_exporter" do
    action      :install
    service     new_resource.service
    binary_url  "https://github.com/prometheus/node_exporter/releases/download/#{node.prometheus_client.node_exporter.version}"
    checksums   node.prometheus_client.node_exporter.checksums
    version     node.prometheus_client.node_exporter.version
    arguments   options.map { |k,v| "-#{k}='#{v}'" }.join(' ')
  end
end

#----------

action :delete do

end