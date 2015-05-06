use_inline_resources

action :install do
  prometheus_client_exporter "consul_exporter" do
    action      :install
    binary_url  "https://github.com/prometheus/consul_exporter/releases/download/#{node.prometheus_client.consul_exporter.version}"
    checksums   node.prometheus_client.consul_exporter.checksums
    version     node.prometheus_client.consul_exporter.version
    arguments   %Q!-consul.server="#{new_resource.server}" -web.listen-address=":#{new_resource.port}"!
  end
end

#----------

action :delete do

end