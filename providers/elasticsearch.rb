use_inline_resources

action :install do
  options = {
    "es.uri"              => new_resource.server,
    "web.listen-address"  => ":#{new_resource.port}"
  }

  prometheus_client_exporter "elasticsearch_exporter" do
    action      :install
    service     new_resource.service
    binary_url  "https://github.com/ewr/elasticsearch_exporter/releases/download/v#{node.prometheus_client.elasticsearch_exporter.version}"
    checksums   node.prometheus_client.elasticsearch_exporter.checksums
    version     node.prometheus_client.elasticsearch_exporter.version
    arguments   options.map { |k,v| "-#{k}='#{v}'" }.join(' ')
  end
end

#----------

action :delete do

end